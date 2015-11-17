class CreateAtttBoards < ActiveRecord::Migration
  def change
    create_table :attt_boards do |t|
      t.string :board, :default=>'000000000'
      t.integer :winner_id
      t.boolean :drawn, :default=>false
      t.string :moves

      t.timestamps null: false
    end
  end
end
