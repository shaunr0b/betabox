class Account < ActiveRecord::Base
  attr_accessible :subdomain, :name  
  
  has_one :address, :as => :addressable
  has_many :phones, :as => :phonable
  has_many :contacts
  
  has_many :users
  
  has_many :locations, :dependent => :destroy, :inverse_of => :account
  
  validates_uniqueness_of :subdomain
  validates_presence_of :name, :subdomain
  
  def admins
     self.users.where(:role_id => User::ADMIN_ROLE_ID)
   end

   def managers
     self.users.where(:role_id => User::MANAGER_ROLE_ID)
   end

   def employees
     self.users.where(:role_id => User::EMPLOYEE_ROLE_ID)
   end

   def customers
     self.users.where(:role_id => User::CUSTOMER_ROLE_ID)
   end
  
end
