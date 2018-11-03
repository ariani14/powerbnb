class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
	  t.integer  :user_id
      t.string   :name
      t.string   :description
      t.string   :location
      t.integer  :guest
      t.string   :room_type
      t.string   :house_type
      t.boolean  :verification
      t.integer  :price
      t.timestamps
    end
  end
end
