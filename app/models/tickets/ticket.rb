class Ticket < ActiveRecord::Base
  attr_accessible :scanned_at, :tier_id
  
  belongs_to :tier
  belongs_to :line_item
end
