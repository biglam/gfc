class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :moves
      t.string :board

      t.timestamps null: false
    end
  end
end
