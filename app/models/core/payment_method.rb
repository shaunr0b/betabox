class PaymentMethod < ActiveRecord::Base
  attr_accessible :is_cash, :is_cc, :name, :code
end
