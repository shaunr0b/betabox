class Product < ActiveRecord::Base
  attr_accessible :short_description, :long_description, :name, :slug, :price, :inventory
  
  # ASSOCIATIONS
  belongs_to :product_group, :inverse_of => :products
  
  # SLUG GENERATION  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  
  
  
end
