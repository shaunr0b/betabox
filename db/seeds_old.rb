# ARTISTS #

require 'xmlsimple'
require_relative './seeds/helpers'

#require_relative './seeds/seed_artists'
require_relative './seeds/seed_accounts'
require_relative './seeds/seed_acts_and_shows'
require_relative './seeds/seed_orders'
require_relative './seeds/seed_customers'
require_relative './seeds/seed_products_and_groups'

#Artist.delete_all
Account.delete_all
Show.delete_all
Act.delete_all
Product.delete_all
ProductGroup.delete_all
Order.delete_all

#seed_artists() 
seed_accounts()
seed_acts_and_shows() 
seed_customers
seed_products_and_groups()
seed_orders()
