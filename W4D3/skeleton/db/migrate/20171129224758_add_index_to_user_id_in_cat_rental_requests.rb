class AddIndexToUserIdInCatRentalRequests < ActiveRecord::Migration[5.1]
  def change
    add_index :cat_rental_requests, :user_id
  end
end
