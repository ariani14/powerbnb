class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string   :email, null: false
      t.string   :encrypted_password, limit: 128, null: false
      t.string   :confirmation_token, limit: 128
      t.string   :remember_token, limit: 128, null: false
      t.integer  :gender
      t.string   :country
      t.boolean  :admin
      t.boolean  :moderator
      t.boolean  :customer
      t.string   :role
      t.string   :first_name
      t.string   :last_name
      t.date   :birthday
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
