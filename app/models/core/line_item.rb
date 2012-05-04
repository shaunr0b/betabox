class LineItem < ActiveRecord::Base
  attr_accessible :description, :price, :quantity
  
  belongs_to :order
  belongs_to :ticket
  
end
