class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.text :description
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
