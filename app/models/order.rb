class Order < ApplicationRecord
	belongs_to :location
	belongs_to :status
	has_many :order_items
	has_one :payment
	
	before_validation :set_order_status_location, on: :create
	
	def subtotal
	  sub = 0
	  
	  self.order_items.each do |oi|
	    sub += (oi.quantity * oi.item_detail.price)
	  end
	  
	  return sub
	end
	
	private 
	def set_order_status_location
	  self.status_id = 1
	  self.location_id = 1
	end
end
