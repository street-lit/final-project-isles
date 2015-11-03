class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :occasion, null: false
      t.text :description
      t.datetime :dateof
      t.boolean :milestone, default: false
      t.belongs_to :friend, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
