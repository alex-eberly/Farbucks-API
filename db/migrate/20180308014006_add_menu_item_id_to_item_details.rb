class AddMenuItemIdToItemDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :item_details, :menu_item_id, :integer
  end
end
