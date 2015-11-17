class CreateAtttGames < ActiveRecord::Migration
  def change
    create_table :attt_games do |t|
      t.integer :p1_id
      t.integer :p2_id
      t.integer :winner_id
      t.boolean :game_won
      t.boolean :game_drawn
      t.integer :current_player
      t.integer :atttmainboard_id
      t.integer :atttboard0_id
      t.integer :atttboard1_id
      t.integer :atttboard2_id
      t.integer :atttboard3_id
      t.integer :atttboard4_id
      t.integer :atttboard5_id
      t.integer :atttboard6_id
      t.integer :atttboard7_id
      t.integer :atttboard8_id
      t.timestamps null: false
    end
  end
end
