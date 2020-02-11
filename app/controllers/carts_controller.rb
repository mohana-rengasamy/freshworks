class CartsController < ApplicationController
    def show
		@order_items = current_order.order_items
	end
	def confirm_order
	   user = current_user
       mail = UserMailer.welcome_email(user.id)
       #mail.deliver_now
       mail.deliver_later
	end

end
