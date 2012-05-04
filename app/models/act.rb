class Act < ActiveRecord::Base
  has_and_belongs_to_many  :artists
  has_many :shows
  belongs_to :venue, :inverse_of => :acts
  
  
  attr_accessible :name, :description, :inventory, :price_range, :line,  :photo

  def as_json(options={})
    super(options.merge(:include => [:shows]) )
  end
  
end





