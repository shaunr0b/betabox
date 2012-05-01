class Act < ActiveRecord::Base
  has_many :shows
  has_and_belongs_to_many  :artists
  attr_accessible :description, :end_date, :inventory, :line, :name, :photo, :price_range, :start_date

  def as_json(options={})
    super(options.merge(:include => [:shows]) )
  end
  
end
