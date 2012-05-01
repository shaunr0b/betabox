def strip_blank_hash(str)
  str = str[0] if str.class.to_s == "Array"
  str = str.to_s 
  str = str == '{}' ? nil : str.to_s
end