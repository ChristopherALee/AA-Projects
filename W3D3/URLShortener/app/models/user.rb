class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  
  has_many :submitted_urls, {
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :user_id
  }
  
  has_many :visits, {
    class_name: 'Visit',
    primary_key: :id,
    foreign_key: :user_id
  }
  
  has_many :visited_urls, through: :visits, source: :shortened_url
end