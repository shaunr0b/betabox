class Phone < ActiveRecord::Base
  attr_accessible :country_code, :local_number, :locality_code, :number, :phonable_id, :phonable_type
end
