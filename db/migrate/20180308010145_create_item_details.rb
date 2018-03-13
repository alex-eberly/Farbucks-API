class CreateItemDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :item_details do |t|
      t.string :size
      t.decimal :price

      t.timestamps
    end
  end
end
