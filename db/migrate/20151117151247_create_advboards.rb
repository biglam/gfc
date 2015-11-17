class CreateAdvboards < ActiveRecord::Migration
  def change
    create_table :advboards do |t|
      t.string :board, :default=>'000000000'
      t.integer :winner_id
      t.boolean :drawn, :default=> false
      t.string :moves
      t.integer :position

      t.timestamps null: false
    end
  end
end
