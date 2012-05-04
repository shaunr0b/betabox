class User < ActiveRecord::Base
  attr_accessible :email, :language, :last_ip, :last_login, :password, :password_confirm, :screen_name, :username
  
  belongs_to :customer
  
end
