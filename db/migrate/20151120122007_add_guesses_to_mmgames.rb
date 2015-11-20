class AddGuessesToMmgames < ActiveRecord::Migration
  def change
    add_column :mmgames, :guess1, :integer
    add_column :mmgames, :guess2, :integer
    add_column :mmgames, :guess3, :integer
    add_column :mmgames, :guess4, :integer
  end
end
