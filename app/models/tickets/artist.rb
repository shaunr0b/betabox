class Artist < ActiveRecord::Base
  has_and_belongs_to_many  :acts
  attr_accessible :tag, :bio
  
  has_one :photo, :as => :photoable
  has_many :shows
  has_many :contacts
  
end
