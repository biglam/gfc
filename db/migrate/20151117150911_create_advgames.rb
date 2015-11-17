class CreateAdvgames < ActiveRecord::Migration
  def change
    create_table :advgames do |t|
      t.integer :p1_id
      t.integer :p2_id
      t.integer :winner_id
      t.boolean :game_won, :default => false
      t.boolean :game_drawn, :default => false
      t.integer :current_player
      t.integer :atttmainboard_id
      t.integer :advboard0_id
      t.integer :advboard1_id
      t.integer :advboard2_id
      t.integer :advboard3_id
      t.integer :advboard4_id
      t.integer :advboard5_id
      t.integer :advboard6_id
      t.integer :advboard7_id
      t.integer :advboard8_id

      t.timestamps null: false
    end
  end
end
