class AddImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_image, :string, :default => 'http://lorempixel.com/400/400/people/'
  end
end
