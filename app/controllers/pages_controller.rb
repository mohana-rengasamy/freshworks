class PagesController < ApplicationController
  def home
    if current_user && current_user.order.nil?
      current_user.order = Order.new
    end
    @products= Product.all
    @order_item = current_order.order_items.new
  end

  def index
    @products= Product.all
    current_user.order = Order.new
    @order_item = current_user.order
  end

 
end
