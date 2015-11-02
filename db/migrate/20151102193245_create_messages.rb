class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.belongs_to :friend, index: true, foreign_key: true
      t.belongs_to :conversation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
