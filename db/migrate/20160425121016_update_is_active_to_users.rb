class UpdateIsActiveToUsers < ActiveRecord::Migration
  def change
    change_column :users, :isActive, :boolean, default: false
  end
end
