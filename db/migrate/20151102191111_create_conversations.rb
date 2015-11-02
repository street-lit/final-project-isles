class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.int :friend_id_one
      t.int :friend_id_two
      t.string :title

      t.timestamps null: false
    end
  end
end
