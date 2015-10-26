class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :message, null: false
      t.string :title, null: false
      t.belongs_to :blog, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
