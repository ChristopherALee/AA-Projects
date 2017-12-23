# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  track_type :string           default("TBD"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :album_id, :title, :ord, :track_type, presence: true
  
  belongs_to :album,
    class_name: 'Album',
    foreign_key: :album_id
  
  has_one :band, through: :album, source: :band
end
