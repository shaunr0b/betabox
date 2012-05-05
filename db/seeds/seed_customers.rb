def seed_customers
  @company = Company.find_by_subdomain('riotact')
  
  customers_file = File.read('./db/data/customers.xml')
  customers_file.gsub!(/&/, '&amp;') # to make valid XML
  
  customer = XmlSimple.xml_in(customers_file)
  
  customer['customer'].each do |c|
    puts c.to_s + '###'
    c = Hash[c.map { |k,v| [k, strip_blank_hash(v[0]) ] } ] # remove blank hashes
    puts c.to_s + '####'
    
    
    a = Address.new
    a.line_1 = c['member_address']# - 114 Kendrick Place
    a.line_2 = c['member_address2']# - Suite 38
    a.city = c['member_city']# - North Potomac
    a.state = c['member_state']# - MD
    a.postal_code = ['member_zip']# - 20878
    a.country = c['member_country']# - 

    p = Phone.new 
    p.number = c['member_phone']# - 240-60

    
    cust = Customer.new
    cust.email = c['email'] #- chris@guruconsult.com
    cust.created_at = Time.at(c['join_date'].to_i).to_datetime
    cust.screen_name = c['member_screen_name']
    cust.last_login = Time.at(c['last_visit'].to_i).to_datetime # - 1313880060
    cust.username = c['username']# - cmarr777
    cust.first_name = c['member_first_name']# - Christopher
    cust.last_name = c['member_last_name']# - Meagher
    cust.company_name = c['member_company']# - 
    
    cust.addresses << a
    cust.phones << p
    cust.company = @company

    
    cust.save!
   
   
  end

end