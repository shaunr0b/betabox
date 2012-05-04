class CreditCard < ActiveRecord::Base
  attr_accessible :customer_id, :exp_month, :exp_year, :type
  
  belongs_to :customer
  
  attr_encrypted :number, :key => ENV['SALT1']
  
end
