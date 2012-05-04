# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Betabox::Application.initialize!


unless Rails.env.production?
  ENV['SALT1'] = %Q(3g&4uLZ8-Ph'r"E2PG@1<3!wGQ3P#K)
end