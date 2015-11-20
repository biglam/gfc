class CreateMmgames < ActiveRecord::Migration
  def change
    create_table :mmgames do |t|
      t.integer :user_id
      t.string :topboard
      t.integer :guesses_remaining
      t.string :board0, :default=>'0000'
      t.string :board1, :default=>'0000'
      t.string :board2, :default=>'0000'
      t.string :board3, :default=>'0000'
      t.string :board4, :default=>'0000'
      t.string :board5, :default=>'0000'
      t.string :board6, :default=>'0000'
      t.string :board7, :default=>'0000'

      t.timestamps null: false
    end
  end
end
