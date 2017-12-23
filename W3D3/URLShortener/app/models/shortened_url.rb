class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true
  
  belongs_to :submitter, {
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id
  }
  
  has_many :visits, {
    class_name: 'Visit',
    primary_key: :id,
    foreign_key: :shortened_url_id
  }
  
  has_many :visitors, through: :visits, source: :user
  
  def self.random_code
    code = SecureRandom::urlsafe_base64
    
    while exists?(short_url: code) 
      code = SecureRandom::urlsafe_base64
    end
    
    code
  end
  
  def self.shorten_url(long_url, user)
    rand_code = self.random_code
    self.create(
      long_url: long_url,
      short_url: rand_code,
      user_id: user.id
    )
  end
  
  def num_clicks
    self.visits.count
  end
  
  def num_uniques
    self.visitors.select(:id).distinct.count
  end
  
  def num_recent_uniques
    self.visitors.select(:id).distinct.where(visits: {created_at: (10.minutes.ago..Time.now)}).count
  end
  
end