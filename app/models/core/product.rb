class Product < ActiveRecord::Base
  attr_accessible :description, :name, :slug, :price
  
  belongs_to :product_group, :inverse_of => :products
end
