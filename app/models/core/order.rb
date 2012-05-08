class Order < ActiveRecord::Base
  attr_accessible :billing_address_id, :customer_id, :shipping_address_id
  
  attr_accessor :state
  
  belongs_to :customer
  has_one :payment
  
  has_many :line_items
  
  has_and_belongs_to_many :discounts
  has_and_belongs_to_many :taxes
  
  #has_many :tickets, :through => :line_item
  
  has_one :billing_address, :class_name => "Address", :as => :addressable, :foreign_key => "billing_address_id"
  has_one :shipping_address, :class_name => "Address", :as => :addressable, :foreign_key => "shipping_address_id"
  
  
  # :still_shopping, :processing_payment, :shipping, :complete
  #state_machine :state, :initial => :still_shopping do
     
  #end
  
  
  
  
end
