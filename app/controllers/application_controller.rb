class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_order
  
  def current_order
    # IF we need the current order id, return it
	if !session[:order_id].nil?
	  Order.find(session[:order_id])
	# ELSE create an order and return that
	else 
	  @order = Order.create
	  session[:order_id] = @order.id
	  return @order
    end
	
  end

end
