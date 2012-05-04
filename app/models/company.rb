class Company < ActiveRecord::Base
  attr_accessible :subdomain, :name
  
  has_one :address, :as => :addressable
  has_many :venues, :dependent => :destroy, :inverse_of => :company
  has_many :acts, :through => :venues
  
  validates_uniqueness_of :subdomain
  validates_presence_of :name, :subdomain
  
end
