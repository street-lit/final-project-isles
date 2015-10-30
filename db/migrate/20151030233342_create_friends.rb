class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :friend_requester
      t.integer :friend_accepter

      t.timestamps null: false
    end
  end
end
