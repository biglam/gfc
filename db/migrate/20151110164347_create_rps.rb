class CreateRps < ActiveRecord::Migration
  def change
    create_table :rps do |t|
      t.integer :p1_id
      t.integer :p2_id
      t.integer :winner_id

      t.timestamps null: false
    end
  end
end
