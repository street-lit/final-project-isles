class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.belongs_to :user, index: true, foreign_key: true
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
