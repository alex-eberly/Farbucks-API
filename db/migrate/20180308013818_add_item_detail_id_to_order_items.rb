class AddItemDetailIdToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :item_detail_id, :integer
  end
end
