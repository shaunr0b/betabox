class Tier < ActiveRecord::Base
  attr_accessible :description, :inventory, :name, :price, :show_id, :starting_inventory
  
  belongs_to :show
  has_many :tickets
  
  
end
