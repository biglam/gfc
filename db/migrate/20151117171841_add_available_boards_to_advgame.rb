class AddAvailableBoardsToAdvgame < ActiveRecord::Migration
  def change
    add_column :advgames, :availableboards, :string, :default => "012345678"
  end
end
