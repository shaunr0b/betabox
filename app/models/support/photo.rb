class Photo < ActiveRecord::Base
  attr_accessible :name, :photoable_id, :photoable_type, :url
end
