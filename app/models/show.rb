class Show < ActiveRecord::Base
  attr_accessible :tag, :inventory, :starts_at, :ends_at
  
  belongs_to :act
  has_many :tiers
end
