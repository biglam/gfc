class AddGameIdToC4Board < ActiveRecord::Migration
  def change
    add_column :c4boards, :game_id, :integer
  end
end
