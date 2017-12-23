require 'sqlite3'
require 'Singleton'
require 'byebug'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class MyModelBase

  def self.table_name
    name = self.to_s.downcase + "s"
    name == "replys" ? name = "replies" : name
  end

  def self.all
    
    all = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    
    return nil if all.length < 1
    
    all.map { |hash| self.new(hash) }    
  end

  def update
    raise "#{self} is not in database" unless self.id
    args = self.instance_variables.reject { |arg| arg == :@id }
    here_doc_args = args.map { |arg| self.instance_variable_get(arg) }
    fixed_args = args.map(&:to_s).map{ |arg| arg[1..-1] }
    table_name = "#{self.class.table_name}"
    
    values = ""
    here_doc_args.each_with_index do |args, idx|
      if idx == here_doc_args.length - 1
        values << "?"
      else
        values << "?,"
      end
    end
    arg_strings = fixed_args.map.with_index { |fixed_arg, idx| "#{fixed_arg} = '#{here_doc_args[idx]}'" }
  
    QuestionsDatabase.instance.execute(<<-SQL, *here_doc_args)
      UPDATE
        #{table_name}
      SET
        #{arg_strings.join(",")}
      WHERE
        id = #{@id}
    SQL
  end
  
  def create
    raise "#{self} is already in database" if self.id
    args = self.instance_variables.reject { |arg| arg == :@id }
    values = ""
    args.each_with_index do |arg, idx|
      if idx == args.length - 1 
        values << "?"
      else
        values << "?,"
      end
    end
    
    fixed_args = args.map(&:to_s).map{ |arg| arg[1..-1] }
    here_doc_args = args.map { |arg| self.instance_variable_get(arg) }
    table_name = "#{self.class.table_name} (#{fixed_args.join(", ")})"
    
    QuestionsDatabase.instance.execute(<<-SQL, *here_doc_args)
      INSERT INTO
        #{table_name}
      VALUES
        (#{values})
    SQL
    
    @id = QuestionsDatabase.instance.last_insert_row_id
  end
  
  def save
    if self.id
      update
    else
      create
    end
  end

end


class User < MyModelBase
  
  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    
    return nil unless user.length > 0
    
    User.new(user.first)
  end
  
  def self.find_by_name(fname, lname)
    fname = fname.capitalize
    lname = lname.capitalize
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    
    return nil unless user.length > 0
    
    User.new(user.first)
  end
  
  def authored_questions
    Question.find_by_author(@id)
  end
  
  def authored_replies
    Reply.find_by_user_id(@id)
  end
  
  def followed_questions
    Question_Follow.followed_questions_for_user_id(@id)
  end
  
  def liked_questions
    Question_Like.liked_questions_for_user_id(@id)
  end
  
  def average_karma
    karma = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        (CAST(COUNT(question_likes.question) AS FLOAT) / CAST(COUNT( DISTINCT (questions.title)) AS FLOAT)) AS avg_karma
      FROM
        questions
      LEFT OUTER JOIN
        question_likes ON question_likes.question = questions.id
      WHERE
        questions.author = ?
    SQL
    
    karma.first['avg_karma']
  end
  
  attr_accessor :id, :fname, :lname
  
  def initialize(users)
    @id = users['id']
    @fname = users['fname']
    @lname = users['lname']
  end
  
  # def update
  #   raise "#{self} is not in database" unless @id
  # 
  #   QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
  #     UPDATE
  #       users
  #     SET
  #       fname = ?, lname = ?
  #     WHERE
  #       id = ?
  #   SQL
  # end
  
  # def create
  #   raise "#{self} is already in database" if @id
  # 
  #   QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
  #     INSERT INTO
  #       users(fname, lname)
  #     VALUES
  #       (?, ?)
  #   SQL
  # 
  #   @id = QuestionsDatabase.instance.last_insert_row_id
  # end
  
  def save
    if @id
      update
    else
      create
    end
  end
end

class Question < MyModelBase
  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    
    return nil unless question.length > 0
    
    Question.new(question.first)
  end
  
  def self.find_by_author(author)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author)
      SELECT
        *
      FROM
        questions
      WHERE
        author = ?
    SQL
    
    return nil unless questions.length > 0
    
    questions.map { |question| Question.new(question) }
  end
  
  def self.find_by_title(title)
    question = QuestionsDatabase.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        questions
      WHERE
        title = ?
    SQL
    
    return nil unless question.length > 0
    
    Question.new(question.first)
  end
  
  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end
  
  def replies
    Reply.find_by_question_id(@id)
  end
  
  def followers
    Question_Follow.followers_for_question_id(@id)
  end
  
  def likers
    Question_Like.likers_for_question_id(@id)
  end
  
  def num_likes
    Question_Like.num_likes_for_question_id(@id)
  end
  
  def self.most_liked(n)
    Question_Like.most_liked_questions(n)
  end
  
  attr_accessor :id, :title, :author
  
  def initialize(questions)
    @id = questions['id']
    @title = questions['title']
    @author = questions['author']
  end
  
  # def self.all
  #   QuestionsDatabase.instance.execute(<<-SQL)
  #   SELECT
  #     *
  #   FROM
  #     questions
  #   SQL
  # end
  
  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @author)
      INSERT INTO
        questions(title, author)
      VALUES
        (?, ?)
    SQL
  end
  
  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @author, @id)
      UPDATE
        questions(title, author)
      SET
        (?, ?)
      WHERE
        id = ?
    SQL
  end
  
  def save
    if @id
      update
    else
      create
    end
  end
end

class Question_Follow < MyModelBase
  def self.find_by_id(id)
    question_fol = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    
    return nil unless question_fol.length > 0
    Question_Follow.new(question_fol.first)
  end
  
  def self.find_by_user_id(user_id)
    question_fol = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        user_id = ?
    SQL
    
    return nil unless question_fol.length > 0
    Question_Follow.new(question_fol.first)
  end
  
  def self.find_by_question_id(question_id)
    question_fol = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_id = ?
    SQL
    
    return nil unless question_fol.length > 0
    Question_Follow.new(question_fol.first)
  end
  
  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM 
        users
      JOIN question_follows
        ON question_follows.user_id = users.id
      WHERE
        question_follows.question_id = ?
    SQL
    
    return nil unless followers.length > 0
    followers.map { |follower| User.new(follower) }
  end
  
  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      JOIN users
        ON users.id = question_follows.user_id
      WHERE
        user_id = ?
    SQL
    
    return nil unless questions.length > 0
    questions.map { |question| Question.new(question) }
  end
  
  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*,
        COUNT(question_follows.user_id)
      FROM
        questions
      JOIN
        question_follows ON question_follows.question_id = questions.id
      GROUP BY
        1
      ORDER BY COUNT(question_follows.user_id) DESC
      LIMIT ?;
    SQL
    
    return nil unless questions.length > 0
    
    questions.map { |hash| Question.find_by_id(hash['id']) }
  end

  attr_accessor :id, :user_id, :question_id
  
  def initialize(question_follows)
    @id = question_follows['id']
    @user_id = question_follows['user_id']
    @question_id = question_follows['question_id']
  end
  
  def save
    if @id
      update
    else
      create
    end
  end
  
  def create
    raise "#{self} is already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @user_id, @question_id)
      INSERT INTO
        question_follows(user_id, question_id)
      VALUES
        (?, ?)
    SQL
  end
  
  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @user_id, @question_id, @id)
      UPDATE
        question_follows(user_id, question_id)
      SET
        (?, ?)
      WHERE
        id = ?
    SQL
  end
end

class Reply < MyModelBase
  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    
    return nil unless reply.length > 0
    
    Reply.new(reply.first)
  end
  
  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    
    return nil unless replies.length > 0
    
    replies.map { |reply| Reply.new(reply) }
  end
  
  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    
    return nil unless replies.length > 0
    
    replies.map { |reply| Reply.new(reply) }
  end
  
  def self.find_by_reply_id(reply_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        reply_id = ?
    SQL
    
    return nil unless reply.length > 0
    
    Reply.new(reply.first)
  end
  
  def author
    @user_id
  end
  
  def question
    @question_id
  end
  
  def parent_reply
    @reply_id
  end
  
  def child_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        reply_id = ?
    SQL
    
    return nil if replies.length < 1
    replies.map { |reply| Reply.new(reply) }
  end
  
  attr_accessor :id, :question_id, :reply_id, :user_id
  
  def initialize(replies)
    @id = replies['id']
    @question_id = replies['question_id']
    @reply_id = replies['reply_id']
    @user_id = replies['user_id']
    @body = replies['body']
  end
  
end

class Question_Like < MyModelBase
  def self.find_by_id(id)
    like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM  
        question_likes
      WHERE
        id = ?
    SQL
    
    return nil unless like.length > 0
    
    Question_Like.new(like.first)
  end
  
  def self.find_by_user(user)
    like = QuestionsDatabase.instance.execute(<<-SQL, user)
      SELECT
        *
      FROM  
        question_likes
      WHERE
        user = ?
    SQL
    
    return nil unless like.length > 0
    
    Question_Like.new(like.first)
  end
  
  def self.find_by_question(question)
    like = QuestionsDatabase.instance.execute(<<-SQL, question)
      SELECT
        *
      FROM  
        question_likes
      WHERE
        question = ?
    SQL
    
    return nil unless like.length > 0
    
    Question_Like.new(like.first)
  end
  
  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        question = ?
    SQL
    
    return nil unless likers.length > 0
    likers.map { |like| Question_Like.new(like) }
  end
  
  def self.num_likes_for_question_id(question_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        COUNT(user)
      FROM
        question_likes
      WHERE
        question = ?
    SQL
    
    likes.first.values.first
  end
  
  def self.liked_questions_for_user_id(user_id)
    liked = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_likes
      JOIN users
        ON users.id = question_likes.user
      WHERE
        user = ?
    SQL
    
    liked.map { |like| Question_Like.new(like) }
  end
  
  def self.most_liked_questions(n)
    most = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.title,
        COUNT(question)
      FROM 
        questions
      JOIN question_likes
        ON question_likes.question = questions.id
      GROUP BY 1
      ORDER BY COUNT(question) DESC
      LIMIT ?
    SQL
    
    return nil if most.length < 1
    most.map { |question| Question.find_by_title(question['title']) }
  end
  
  attr_accessor :id, :user, :question
  
  def initialize(likes)
    @id = likes['id']
    @user = likes['user']
    @question = likes['question']
  end
end