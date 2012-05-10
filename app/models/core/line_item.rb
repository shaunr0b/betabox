class LineItem < ActiveRecord::Base
  attr_accessible :description, :price, :quantity
  
  belongs_to :order
  has_one :product
  belongs_to :ticket
  
end
