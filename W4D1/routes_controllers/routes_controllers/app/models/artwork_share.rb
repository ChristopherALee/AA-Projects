# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#

class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :viewer_id, uniqueness: {scope: :artwork_id}
  
  belongs_to :artwork,
    class_name: 'Artwork',
    foreign_key: :artwork_id
    
  belongs_to :viewer,
    class_name: 'User',
    foreign_key: :viewer_id
end
