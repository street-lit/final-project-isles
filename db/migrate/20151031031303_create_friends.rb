class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :friend_requester_id
      t.integer :friend_accepter_id

      t.timestamps null: false
    end
  end
end
