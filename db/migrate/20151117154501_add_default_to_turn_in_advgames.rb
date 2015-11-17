class AddDefaultToTurnInAdvgames < ActiveRecord::Migration
  def change
    change_column :advgames, :current_player, :integer, :default => 1

  end
end
