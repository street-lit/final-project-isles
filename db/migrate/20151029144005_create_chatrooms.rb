class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.string :topic

      t.timestamps null: false
    end
  end
end
