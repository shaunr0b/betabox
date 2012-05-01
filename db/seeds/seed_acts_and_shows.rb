def seed_acts_and_shows()
 shows_file = File.read('./db/data/shows.xml')
 c = XmlSimple.xml_in(shows_file)
 c['act'].each do |act|
   #puts "################\n"
   #puts act
   #puts "################\n"
   
   act_params = {}

   act_params['name'] = strip_blank_hash act['name']
   act_params['photo'] = strip_blank_hash act['photo']
   act_params['inventory'] = strip_blank_hash act['inventory']
   act_params['start_date'] = Time.at((strip_blank_hash act['start_date']).to_i)
   act_params['price_range'] = strip_blank_hash act['price_range']
   act_params['line'] = strip_blank_hash act['line']
   act_params['end_date'] = Time.at((strip_blank_hash act['end_date']).to_i)
   act_params['description'] = strip_blank_hash act['description']
   
   new_act = Act.create(act_params)
   
   ### Add each artist to new act
   unless act['comedians'][0]['artist'].nil?
     act['comedians'][0]['artist'].each do |artist|
       ar = Artist.where(:name => artist)
       unless ar.nil?
         new_act.artists << ar
       end
     end
   end
   
   ### Add each show to new 
   unless act['shows'][0]['show'].nil?
     act['shows'][0]['show'].each do |show|
       name = strip_blank_hash show['option']
       name_alt = strip_blank_hash show['option_name']
       price = (strip_blank_hash show['price'][0]).to_f
       inventory = (strip_blank_hash show['inventory'][0]).to_i
     
       s = Show.create!(:inventory => inventory, :name => name, :name_alt => name_alt, :price => price)
       new_act.shows << s
     end
   end
   
   new_act.save!
   
 end
end