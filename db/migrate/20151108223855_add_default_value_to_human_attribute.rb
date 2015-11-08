class AddDefaultValueToHumanAttribute < ActiveRecord::Migration
  def up
    change_column :users, :human, :boolean, :default => true
  end

  def down
    change_column :users, :human, :boolean, :default => nil
  end
end
