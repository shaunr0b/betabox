class User < ActiveRecord::Base
  attr_accessible :email, :language, :last_ip, :last_login, 
                  :password, :screen_name, :username, 
                  :first_name, :last_name, :role_id 
                  
  attr_accessor :password_confirmation
  
  belongs_to :account
  
  has_many :addresses, :as => :addressable
  has_many :phones, :as => :phonable
  has_one :photo, :as => :photable

  validates_presence_of :email
  validates_uniqueness_of :email, :scope => :account_id 
  validates_uniqueness_of :username, :scope => :account_id 
  validates_confirmation_of :password
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  ADMIN_ROLE_ID = 1
  MANAGER_ROLE_ID = 2
  EMPLOYEE_ROLE_ID = 3
  CUSTOMER_ROLE_ID = 4
  
  #alias :is_owner? :is_admin? 
  
  def is_admin?
    self.role_id == ADMIN_ROLE_ID
  end
  
  def is_manager?
    self.role_id == MANAGER_ROLE_ID
  end
  
  def is_customer?
    self.role_id == EMPLOYEE_ROLE_ID
  end
  
  def is_customer?
     self.role_id == CUSTOMER_ROLE_ID
  end
  
end
