class CreateC4boards < ActiveRecord::Migration
  def change
    create_table :c4boards do |t|
      t.string :r1
      t.string :r2
      t.string :r3
      t.string :r4
      t.string :r5
      t.string :r6

      t.timestamps null: false
    end
  end
end
