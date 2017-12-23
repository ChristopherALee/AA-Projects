class UpdateUserNull < ActiveRecord::Migration[5.1]
  def change
        remove_column :users, :username
        add_column :users, :username, :string, null: false
        
  end
end
