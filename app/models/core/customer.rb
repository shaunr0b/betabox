class Customer < User
  attr_accessible :birthdate, :gender, :name, :user_id
  
  has_many :addresses, :as => :addressable
  has_many :phones, :as => :phonable
  
  has_many :orders
  
  has_many :credit_cards
  belongs_to :user

end
