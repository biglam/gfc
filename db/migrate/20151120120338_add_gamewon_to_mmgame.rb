class AddGamewonToMmgame < ActiveRecord::Migration
  def change
    add_column :mmgames, :complete, :boolean, :default => false
    add_column :mmgames, :won, :boolean, :default => false
  end
end
