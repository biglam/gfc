class AddP1MoveP2MoveToRps < ActiveRecord::Migration
  def change
    add_column :rps, :p1_move, :integer
    add_column :rps, :p2_move, :integer
  end
end
