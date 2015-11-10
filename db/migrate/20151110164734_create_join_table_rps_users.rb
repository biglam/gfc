class CreateJoinTableRpsUsers < ActiveRecord::Migration
  def change
    create_join_table :rps, :users do |t|
      # t.index [:rp_id, :user_id]
      # t.index [:user_id, :rp_id]
    end
  end
end
