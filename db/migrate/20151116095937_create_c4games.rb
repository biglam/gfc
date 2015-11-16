class CreateC4games < ActiveRecord::Migration
  def change
    create_table :c4games do |t|
      t.integer :board_id
      t.integer :p1_id
      t.integer :p2_id
      t.integer :winner_id

      t.timestamps null: false
    end
  end
end
