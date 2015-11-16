class ChangeGameIdToC4gameIdInC4boards < ActiveRecord::Migration
  def change
    rename_column :c4games, :board_id, :c4board_id
  end
end
