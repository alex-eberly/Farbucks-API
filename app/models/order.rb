class Order < ApplicationRecord
	belongs_to :location
	belongs_to :status
	has_many :order_items
end
