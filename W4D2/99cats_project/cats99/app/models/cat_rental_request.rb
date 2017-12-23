# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#

class CatRentalRequest < ApplicationRecord
  STATUS_OPTIONS = ['APPROVED', 'DENIED', 'PENDING']
  
  validates :status, presence: true
  validates :status, inclusion: { in: STATUS_OPTIONS, message: "No status available" }
  # validate does_not_overlap_approved_request
  
  belongs_to :cat,
    class_name: 'Cat',
    foreign_key: :cat_id,
    dependent: :destroy
    
  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: self.cat_id)
      .where.not("start_date > ? or end_date < ?", self.end_date, self.start_date)
  end
  
  def overlapping_approved_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: self.cat_id)
      .where(status: "APPROVED")
      .where.not("start_date > ? or end_date < ?", self.end_date, self.start_date)
  end
  
  def does_not_overlap_approved_request
    !overlapping_approved_requests.exists?
  end
end
