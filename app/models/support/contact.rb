class Contact < ActiveRecord::Base
  attr_accessible :artist_id, :email, :name
  
  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :phones, :as => :phoneable, :dependent => :destroy
  belongs_to :artist


  
end
