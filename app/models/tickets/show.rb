class Show < ActiveRecord::Base
  attr_accessible :short_description, :long_description, :name, :slug, :price, :inventory, :starts_at, :ends_at  
end