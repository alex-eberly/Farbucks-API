class AddMenuCategoryIdToMenuItems < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_items, :menu_category_id, :integer
  end
end
