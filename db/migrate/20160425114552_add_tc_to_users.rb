class AddTcToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tc, :string
    add_index :users, :tc, unique: true
  end
end
