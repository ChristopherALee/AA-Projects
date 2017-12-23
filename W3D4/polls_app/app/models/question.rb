class Question < ApplicationRecord
  validates :text, :poll_id, presence: true
  
  has_many :answer_choices, {
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id
  }
  
  belongs_to :poll, {
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id
  }
  
  has_many :responses, through: :answer_choices, source: :responses
  
  def results
    results = Hash.new(0)
    
    resp = self.responses.includes(:answer_choice)
    
    resp.each do |response|
      results[response.answer_choice.text] += 1 
    end
    
    results
  end
  
  def execute(sql)
    conn = PG::Connection.open(:dbname => 'polls_app_development')
    query_result = conn.exec(sql).values
    conn.close

    query_result
  end

  def results_sql
    # execute(<<-SQL)
    #   SELECT
    #     answer_choices.text,
    #     COUNT(responses.id) AS response_count
    #   FROM
    #     answer_choices
    #   LEFT OUTER JOIN
    #     responses on answer_choices.id = responses.answer_choice_id
    #   WHERE
    #     answer_choices.question_id = #{self.id}
    #   GROUP BY
    #     answer_choices.id
    # SQL
    
    sub_result = AnswerChoice.find_by_sql(<<-SQL)
      SELECT
        answer_choices.text,
        COUNT(responses.id) as response_count
      FROM
        answer_choices
      LEFT OUTER JOIN
        responses on answer_choices.id = responses.answer_choice_id
      WHERE
        answer_choices.question_id = #{self.id}
      GROUP BY
        answer_choices.text
    SQL
      
    result = Hash.new
    
    sub_result.each do |answer_choice|
      result[answer_choice.text] = answer_choice.response_count
    end
    
    result
  end
  
  def ar_results
    AnswerChoice
      .select(:text)
      .joins("LEFT OUTER JOIN responses on answer_choices.id = responses.answer_choice_id")
      .where(question_id: self.id)
      .group(:text)
      .count('responses.id')
  end
  
end