class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :store_number
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
