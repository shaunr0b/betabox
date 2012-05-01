class Artist < ActiveRecord::Base
  has_and_belongs_to_many  :acts
  attr_accessible :bio, :email, :name, :phone, :photo, :tag, :slug
end
