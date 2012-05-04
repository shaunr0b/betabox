def seed_customers
  customers_file = File.read('./db/data/customers.xml')
  customers_file.gsub!(/&/, '&amp;')
  c = XmlSimple.xml_in(customers_file)
  c['customer'].each do |cust|
   cust.each do |k,v|
     puts "#{k} - #{v[0]}\n"
   end
   puts "#####################\n\n\n\n\n\n\n\n"
  end

end