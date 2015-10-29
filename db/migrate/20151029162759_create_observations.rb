class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.text :body
      t.belongs_to :photo, index: true, foreign_key: true
      t.belongs_to :album, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
