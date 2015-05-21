class CartsController < ApplicationController
  # before_action :find_cart, except: [ :index, :new, :create ]
  #
  # def find_cart
  #   @cart = Cart.find(params[:id])
  # end
  #
  # def cart_params
  #   params.require(:cart).permit(:name, :price, :stock, :views)
  # end

  def show
    @cart.decrement!(:stock)
  end

  def create
    @cart = Cart.create(product_id: @product.id, name: @product.name, price: @product.price)
    redirect_to cart_url(@cart), notice: 'Product Created!'
  end

  def edit; end

  def update
    @cart.update_attributes(params.require(:cart).permit(:quantity))
    redirect_to cart_path(@cart), notice: 'Product Updated!'
  end

  def destroy
    @cart.destroy
    redirect_to carts_path, notice: 'Product Deleted from cart!'
  end

  def new
    @cart = Cart.new
  end
end
