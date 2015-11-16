class ChangeGameIdToC4gameIdInC4boards2 < ActiveRecord::Migration
  def change
    rename_column :c4boards, :game_id, :c4game_id
  end
end
