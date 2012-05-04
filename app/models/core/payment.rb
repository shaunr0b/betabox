class Payment < ActiveRecord::Base
  attr_accessible :amount, :order_id, :transaction_id
end
