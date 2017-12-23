class AddFinishedtoGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :finished?, :boolean, default: false
  end
end
