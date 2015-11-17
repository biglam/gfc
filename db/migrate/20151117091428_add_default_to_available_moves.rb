class AddDefaultToAvailableMoves < ActiveRecord::Migration
  def change
    change_column :c4boards, :available_moves, :string, :default => '0123456'
  end
end
