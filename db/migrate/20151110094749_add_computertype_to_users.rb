class AddComputertypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :computer_type, :string, :default=>'random'
  end
end
