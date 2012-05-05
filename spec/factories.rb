# encoding: UTF-8

# COMPANY
FactoryGirl.define do
  
  factory :account do
   name "Jammin Java"
   sequence(:subdomain) {|n| "sub#{n}" }
   
   #subdomain { generate(:subdomain) }
   
   factory :account_with_locations do
     ignore do
       locations_count 2
     end
     
     after_create do |account, evaluator|
       FactoryGirl.create_list(:location, evaluator.locations_count, account: account)
     end
   end
   
  end
end

# VENUE
FactoryGirl.define do
  factory :location do
   name "Jammin Java"
   address
  end
end

# ARTIST
FactoryGirl.define do
  factory :artist do
   name "Jason Dudey"
   tag 'This guy is hysterical.'
   bio %Q[<p>Jason Dudey has been performing around the country for the past decade, sharing his quirky views on every day life, love and family.&nbsp; He has opened for Judy Gold, Ant, Natasha Legerro, Craig Shoemaker, Sandra Bernhardt and more; he has appeared on LOGO's Wisecracks—OutLaugh Comedy Festival; and he currently tours the US of A with the brilliant Kathleen Madigan.&nbsp; He is the creator and producer of “Come Out Laughing” – a comedy extravaganza that features only the funniest comedians regardless of who they sleep with.&nbsp; As the host of The Jason Dudey Show, Jason brings the best, most entertaining, aspects of the comedy world to your radio, computer, iPod/pad/phone/book/etc. and fulfills a lifelong dream of taking his talented tongue to the world of radio. Check out The Jason Dudey Show on <a href=\"http://www.gvbradio.com\">http://www.gvbradio.com</a> or stitcher or itunes or call his mother, she might have a copy.\n</p>" ]
   website_url 'http://www.jasondudey.com'
  end
end

# ACT
FactoryGirl.define do
  factory :act do
   name "The Beatles Unplugged"
   line "Come see the greatest show on earth "
   description "<p>This will be one to knck your socks off</p>"
   inventory 1000
   price_range "$3 - $15"
  end
end

# SHOW 
FactoryGirl.define do
  factory :show do    
   tag "Friday Night 8pm"
   inventory 300   
   starts_at Time.at (DateTime.now() - 60 * 60 * 51).to_i
   ends_at Time.at (DateTime.now() - 60 * 60 * 48).to_i
  end
end

# ADDRESS
FactoryGirl.define do
  factory :address do    
   tag 'JJ Vienna'
   name 'Daniel Brindley'
   line_1 '123 Maple Ave'
   line_2 ''
   city 'Vienna'
   state 'VA'
   postal_code '22013'
  end
end

# PHONE
FactoryGirl.define do
  factory :phone do    
   number '+1 (301) 956 0110'
   country_code '1'
   locality_code '301'
   local_number '956 0110'
  end
end