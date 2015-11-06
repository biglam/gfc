class AddPointsAndRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :points, :integer, :default => 0
    add_column :users, :role, :string, :default => "user"
  end
end
