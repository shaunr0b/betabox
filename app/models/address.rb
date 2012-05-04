class Address < ActiveRecord::Base
  attr_accessible :addressable_id, :addressable_type, :city, :fax, :line_1, :line_2, :name, :phone, :postal_code, :state

  belongs_to :addressable, :polymorphic => true
  
  
end
