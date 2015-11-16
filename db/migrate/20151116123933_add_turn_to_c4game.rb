class AddTurnToC4game < ActiveRecord::Migration
  def change
    add_column :c4games, :turn, :integer, :default => 1
  end
end
