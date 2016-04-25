class AddIsActiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isActive, :boolean
  end
end
