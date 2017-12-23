# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS = ['red','black','blue','orange','grey']
  
  validates :birth_date, :color, :name , :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS, message: "Color doesn't exist." }
  validates :sex, inclusion: { in: ['M', 'F'] }
  
  has_many :cat_rental_requests,
    class_name: 'CatRentalRequest',
    foreign_key: :cat_id
end
