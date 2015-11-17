class AddAvailableMovesToC4board < ActiveRecord::Migration
  def change
    add_column :c4boards, :available_moves, :string
  end
end
