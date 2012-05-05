class Location < ActiveRecord::Base
  attr_accessible :company_id, :name
  
  has_many :contacts
  has_one :address, :as => :addressable
  has_many :phones, :as => :phonable
  belongs_to :account, :inverse_of => :locations
  has_many :acts, :inverse_of => :location

end
