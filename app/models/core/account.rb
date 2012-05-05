class Account < ActiveRecord::Base
  attr_accessible :subdomain, :name  
  
  has_one :address, :as => :addressable
  has_many :phones, :as => :phonable
  has_many :contacts
  
  has_many :customers
  #has_many :employees
  #has_many :managers
  
  has_many :locations, :dependent => :destroy, :inverse_of => :account
  
  validates_uniqueness_of :subdomain
  validates_presence_of :name, :subdomain
  
end
