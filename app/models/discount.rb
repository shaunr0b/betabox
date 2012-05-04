class Discount < ActiveRecord::Base
  attr_accessible :flat_amount, :name, :percentage
  
  has_and_belongs_to_many :orders
end
