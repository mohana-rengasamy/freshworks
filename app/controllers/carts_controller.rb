class CartsController < ApplicationController
    def show
		@order_items = current_order.order_items
	end

	def confirm_order
	   
	   if current_user && !current_user.order.nil? && current_user.order.order_items.count != 0 
		user = current_user
		mail = UserMailer.welcome_email(user.id)
		mail.deliver_now
		#mail.deliver_later
		current_user.order.order_items.each do |item|
			OrderItemHistory.create(user_id: item.order.user.id, product_id: item.product.id)
		   end
		current_user.order = Order.new

	  elsif  current_user && current_user.order.order_items.count==0
		  
		 redirect_to(carts_status_path, notice: 'CANNOT PLACE ORDER WITH NO ORDERS')
	  end
	end

	def status
	end



end
