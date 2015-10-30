class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :requested_friend_id
      t.boolean :are_friends
      t.boolean :did_confirm, default: false

      t.timestamps null: false

    end
  end
end
