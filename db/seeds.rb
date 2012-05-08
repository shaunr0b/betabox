require_relative './seeds/helpers'

# 1. Create Accounts 
# 2. Create Users (100)
# 3. Add product groups + products
# 4. Add discounts, taxes, coupons, payment methods
# 5. Add customers
# 6. Add orders and payments'

Account.delete_all
User.delete_all
Product.delete_all
ProductGroup.delete_all
Discount.delete_all
Tax.delete_all

NUMBER_OF_ACCOUNTS = 10
NUMBER_OF_USERS = 1000
NUMBER_OF_DISCOUNTS = 10
NUMBER_OF_TAXES = 5


seed_accounts = true
seed_users = true # must seed accounts too 
seed_products = true
seed_discounts = true
seed_taxes = true

################
### ACCOUNTS ###
################

NUMBER_OF_ACCOUNTS.times do
  co_name = Forgery::Name.company_name
  co_subdomain = co_name.gsub(/ /, '_').downcase
  
  Account.create({
  :subdomain => co_subdomain,
  :name => co_name
  })
end if seed_accounts
  
################
##### USERS ####
################

NUMBER_OF_USERS.times do
  pw = Forgery::Basic.password
  
  first_name = Forgery::Name.first_name
  last_name = Forgery::Name.last_name
  screen_name = "#{first_name} #{last_name}"
  user_name = screen_name.gsub(/ /, '_').downcase
  random_account_offset = rand(NUMBER_OF_ACCOUNTS)
  account = Account.first(:offset => random_account_offset)
  

  new_user = User.create({
    :email => Forgery::Internet.email_address,
    :password => pw,
    :first_name => first_name,
    :last_name => last_name,
    :screen_name => screen_name,
    :username => user_name,
  })
  
  
  account.users << new_user
  
  # if no admins, make this the admin
  if account.admins.count == 0
    new_user.role_id = User::ADMIN_ROLE_ID
    role = 'Admin'
  elsif account.employees.count < 10
    new_user.role_id = User::EMPLOYEE_ROLE_ID
    role = 'Employee'
  elsif account.managers.count < 3
    new_user.role_id = User::MANAGER_ROLE_ID
    role = 'Manager'
  else
    role = 'Customer' # default is CUSTOMER
  end
  
  puts "### SEEDING #{role} #{new_user.full_name} to Account #{account.name}"
  
  begin
    new_user.save
    account.save
  end
end if seed_users



################################
####### PRODUCTS + GROUPS #####
################################
# :short_description, :long_description, :name, :parent_id, :slug
if seed_products
  products = YAML.load( File.open('./db/data/products.yml') )

  parse_products products
end


#############################
######### DISCOUNTS ########
#############################
NUMBER_OF_DISCOUNTS.times do
  words = ['reduced', 'discount', 'coupon', 'off']
  
  if rand(2) == 1 # IS FLAT
    flat_amount = Forgery::Basic.number(:at_least => 1, :at_most => 50)
    name = "$#{flat_amount} #{words[rand(4)]}"
    Discount.create(:name => name, :flat_amount => flat_amount)
  else
    percentage = Forgery::Basic.number(:at_least => 1, :at_most => 100)
    name = "#{percentage}% #{words[rand(4)]}"
    Discount.create(:name => name, :percentage => percentage)
  end
  
  puts "### SEEDING DISCOUNT #{name}"
  
end if seed_discounts

#############################
######### TAXES ########
#############################

NUMBER_OF_TAXES.times do
  percentage = Forgery::Monetary.money(:at_least => 1, :at_most => 20)
  words = ['Sales', 'VAT', 'Liquor']
  name = "#{ words[rand(3)] } Tax: #{percentage}%"
  Tax.create(:name => name, :percentage => percentage)
  puts "### SEEDING TAX #{name}"
  
end if seed_taxes


#############################
######### ORDERS ########
#############################



