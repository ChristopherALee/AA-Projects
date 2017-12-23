class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :author_cant_respond_to_own_poll
  
  belongs_to :answer_choice, {
    class_name: 'AnswerChoice',
    foreign_key: :answer_choice_id,
    primary_key: :id
  }
  
  belongs_to :respondent, {
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  }
  
  has_one :question, through: :answer_choice, source: :question
  
  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end
  
  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.respondent.id)
  end
  
  def author_cant_respond_to_own_poll
    if self.answer_choice.question.poll.author.id == self.respondent.id
      errors[:cant_game_poll] << 'author can\'t respond to own poll'
    end
  end
  
end