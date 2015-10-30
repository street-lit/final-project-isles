class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :requested_friend_id
      t.boolean :are_friends
      t.boolean :did_confirm

      t.timestamps null: false

      add_index :requests, :user_id
      add_index :requests, :requested_friend_id
      add_index :requests, [:user_id, :requested_friend_id], unique: true
    end
  end
end
