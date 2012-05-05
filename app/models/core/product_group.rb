class ProductGroup < ActiveRecord::Base
  #before_save :add_parent_id_to_fields
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  acts_as_nested_set
  attr_accessible :description, :name, :parent_id, :slug
  
  has_many :fields, :as => :fieldable  
  
  has_many :products
  
  validates_presence_of :name
  
  
  
  #############
  # The section below allows custom fields to be added dynamically, on the fly.
  ############
  
  def add_parent_id_to_fields
    if self.fields
      fields.each do |field|
        field.parent_id = self.id if field.parent_id != self.id
        field.save!
      end
    end
  end
  
  def set_field(slug, value)
    slug = slug.to_s
    f = self.fields.find_or_initialize_by_slug(slug)
    f.parent_id = self.id
    f.value = value
    f.save!
  end
  
  def delete_field(slug)
    slug = slug.to_s if slug.class.name == 'Symbol' 
    f = self.fields.find_by_slug(slug)
    f.delete if f
  end
  
  # Allows field to be get and set dynamically as an object property
  # e.g. ProductGroup.show_time 
  # ... but only if it exists already
  
  def method_missing(method_name, *args, &block)
    field_name = method_name
    is_set = field_name[-1,1] == '='  #true if is set, false if is get
    field_name = field_name[0,field_name.length-1] if is_set
    
    field = Field.where(:slug => field_name, :parent_id => self.id).first
    
    if field && is_set
      set_field(field_name, args[0])
      return args[0]
    elsif field && !is_set
      return field.get_value
    end
    
    super(method_name, *args, &block)
    
  end
  
  
end
