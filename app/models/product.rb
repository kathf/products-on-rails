class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :views, :price, :stock, numericality: { greater_than_or_equal_to: 0 }  
end
