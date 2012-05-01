class Show < ActiveRecord::Base
  belongs_to :act
  attr_accessible :inventory, :name, :name_alt, :price
end
