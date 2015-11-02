class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.belongs_to :friend, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
