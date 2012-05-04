class Customer < ActiveRecord::Base
  attr_accessible :birthdate, :gender, :name, :user_id
  
  
  has_many :credit_cards
  has_many :addresses, :as => :addressable
  belongs_to :user

end
