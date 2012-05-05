class Field < ActiveRecord::Base
  belongs_to :fieldable, :polymorphic => true
  
  attr_accessible :slug, :parent_id
  attr_accessor :value
  attr_protected :value_string, :value_integer, :value_text, :value_decimal, :value_datetime, :value_boolean 
  
  before_save :set_dynamic_value
  
  def set_dynamic_value
    puts 'BEOFRE SAVE CALLED'
    clear_values
    set_value
  end
  
 def get_value
   return self.value_string unless self.value_string == nil
   return self.value_integer unless self.value_integer == nil
   return self.value_text unless self.value_text == nil
   return self.value_decimal unless self.value_decimal == nil
   return self.value_datetime unless self.value_datetime == nil
   return self.value_boolean unless self.value_boolean == nil
 end
 protected
 
  
  def set_value
    #return if self.value.nil? || self.value == '' 
    
    case self.value.class.to_s
      when 'String'
        if self.value.length < 255
          self.value_string = self.value
        else
          self.value_text = self.value
        end
      when 'Float', 'Decimal'
        self.value_decimal = self.value
      when 'Fixnum'
        self.value_integer = self.value
      when 'FalseClass', 'TrueClass'
        self.value_boolean = self.value
      when 'DateTime'
        self.value_datetime = self.value
      else
        raise 'Invalid field type. Must be one of String, Float, Decimal, FixNum, Boolean, or DateTime'
     end
     true
  end
  
  def clear_values
    self.value_string = nil
    self.value_integer = nil
    self.value_text = nil
    self.value_decimal = nil
    self.value_datetime = nil
    self.value_boolean = nil
  end
  
end