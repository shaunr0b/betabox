def seed_companies
  Company.delete_all
  Company.create!({
    :subdomain => 'riotact',
    :name => 'Riot Act Comedy Theater'
    :address => Address.new()
  })
  Company.create!(:subdomain => 'jamminjava', :name => "Jammin' Java")
  Company.create!(:subdomain => 'blackcat', :name => "The Black Cat")
  
  5.times do ||
  
  
end