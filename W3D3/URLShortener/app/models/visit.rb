class Visit < ApplicationRecord
  validates :user_id, presence: true
  validates :shortened_url_id, presence: true
  
  belongs_to :user, {
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id
  }
  
  belongs_to :shortened_url, {
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :shortened_url_id
  }
  
  def self.record_visit!(user, shortened_url)
    self.create(
      user_id: user.id,
      shortened_url_id: shortened_url.id
    )
  end
end