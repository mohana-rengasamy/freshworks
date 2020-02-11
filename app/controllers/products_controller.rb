class ProductsController < ApplicationController
  
  def index
    @order_item = current_order.order_items.new
    search = params[:term].present? ? params[:term] : nil
    @products = if search
      Product.search(search)
    else

    @products =Product.all
  end
end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path 
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  private
    def product_params
      params.require(:product).permit(:title, :price)
    end
end
