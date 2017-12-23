# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  year       :integer          not null
#  album_type :string           default("TBD"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :band_id, :title, :year, :album_type, null: false
  
  belongs_to :band,
    class_name: 'Band',
    foreign_key: :band_id
  
  has_many :tracks,
    class_name: 'Track',
    foreign_key: :album_id
end
