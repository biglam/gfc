class RenameTableAtttGamesToAtttGames < ActiveRecord::Migration
  def up
    rename_table :attt_games, :atttgames
  end 
  def down
    rename_table :atttgames, :attt_games
  end
end
