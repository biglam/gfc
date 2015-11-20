class CreateMinesweepers < ActiveRecord::Migration
  def change
    create_table :minesweepers do |t|
      t.string :board
      t.string :flagged
      t.string :bombs
      t.integer :user_id
      t.boolean :completed
      t.boolean :won
      t.string :numbers

      t.timestamps null: false
    end
  end
end
