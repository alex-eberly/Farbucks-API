class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :menu_image

      t.timestamps
    end
  end
end
