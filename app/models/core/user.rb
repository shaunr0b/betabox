class User < ActiveRecord::Base
  attr_accessible :email, :language, :last_ip, :last_login, :password, :screen_name, :username
  attr_accessor :password_confirmation
  
  belongs_to :account

  validates_uniqueness_of :email, :scope => :company_id 
  validates_uniqueness_of :username, :scope => :company_id 
  
  validates_presence_of :account_id
  validates_presence_of :email
  validates_confirmation_of :password
  
  
end
