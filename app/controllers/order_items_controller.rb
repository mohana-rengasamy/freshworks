class OrderItemsController < ApplicationController
    def create
		@order = current_user.order
		@order_item = @order.order_items.new(order_item_params)
		@order.user_id = current_user.id
		@order.save
		session[:order_id] = @order.id
    end
    

	def update
		@order = current_user.order
		@order_item = @order.order_items.find(params[:id])
		@order_item.update_attributes(order_item_params)
		@order_items = @order.order_items
		redirect_to carts_path
	end

	def destroy
		@order = current_user.order
		@order_item = @order.order_items.find(params[:id])
		@order_item.destroy
		@order_items = @order.order_items
		redirect_to carts_path
	end


	private
		def order_item_params
			params.require(:order_item).permit(:product_id, :quantity)
		end
end
