class AddP1IdAndP2IdToGames < ActiveRecord::Migration
  def change
    add_column :games, :p1_id, :integer
    add_column :games, :p2_id, :integer
  end
end
