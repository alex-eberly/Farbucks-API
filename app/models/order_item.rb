class OrderItem < ApplicationRecord
	belongs_to :item_detail
	belongs_to :order
end
