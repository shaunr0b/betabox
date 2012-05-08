def seed_accounts
  Account.delete_all
  Account.create!({
    :subdomain => 'riotact',
    :name => 'Riot Act Comedy Theater'
  })
  Account.create!(:subdomain => 'jamminjava', :name => "Jammin' Java")
  Account.create!(:subdomain => 'blackcat', :name => "The Black Cat")
  
  
end