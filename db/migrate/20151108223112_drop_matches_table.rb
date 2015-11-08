class DropMatchesTable < ActiveRecord::Migration
  def change
    drop_table :matches
    drop_table :matches_users
  end
end
