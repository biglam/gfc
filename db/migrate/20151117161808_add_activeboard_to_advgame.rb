class AddActiveboardToAdvgame < ActiveRecord::Migration
  def change
    add_column :advgames, :activeboard, :integer, :default => 10
  end
end
