module ProductsHelper
  def top_product?(product)
    product.views >= 100
  end

end
