class ProductGroup < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  acts_as_nested_set
  attr_accessible :description, :name, :parent_id, :slug
  
  has_many :products
  
  validates_presence_of :name
  
end
