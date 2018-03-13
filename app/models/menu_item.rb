class MenuItem < ApplicationRecord
	belongs_to :menu_category
	has_many :item_details
end
