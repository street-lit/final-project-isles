class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :description
      t.string :location
      t.belongs_to :album, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
