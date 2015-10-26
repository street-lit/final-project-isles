class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :username, null: false
      t.integer :age
      t.string :city
      t.string :state
      t.string :twitter
      t.string :github
      t.string :linkedin
      t.string :phone_number
      t.datetime :birthday
      t.string :soundcloud
      t.string :facebook
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
