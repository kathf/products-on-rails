class ProductsController < ApplicationController
  before_action :find_product, except: [ :index, :new, :create ]

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :stock, :views)
  end

  def index
    @products = Product.all
  end

  def show
    @product.increment!(:views)
  end

end
