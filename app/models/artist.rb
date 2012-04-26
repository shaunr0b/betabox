class Artist < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :phone, :photo, :tag, :slug
end
