class AddDefaultToC4board < ActiveRecord::Migration
  def change
    change_column :c4boards, :r1, :string, :default => '0000000'
    change_column :c4boards, :r2, :string, :default => '0000000'
    change_column :c4boards, :r3, :string, :default => '0000000'
    change_column :c4boards, :r4, :string, :default => '0000000'
    change_column :c4boards, :r5, :string, :default => '0000000'
    change_column :c4boards, :r6, :string, :default => '0000000'
  end
end
