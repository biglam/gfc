class AddP1IdAndP2IdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :p1_id, :integer
    add_column :matches, :p2_id, :integer
  end
end
