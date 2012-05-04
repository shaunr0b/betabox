class Tax < ActiveRecord::Base
  attr_accessible :name, :percentage, :fixed
  
  has_and_belongs_to_many :orders
  
end
