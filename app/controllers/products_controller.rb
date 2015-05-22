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

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_url(@product), notice: 'Product Created!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update_attributes(product_params)
      redirect_to product_path(@product), notice: 'Product Updated!'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product Deleted from product!'
  end

end
