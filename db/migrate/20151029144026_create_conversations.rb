class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :name
      t.string :topic
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :chatroom, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
