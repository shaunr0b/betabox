def seed_artists
  artists_file = File.read('./db/data/artists.xml')
  c = XmlSimple.xml_in(artists_file)
  c['artist'].each do |artist|
   # remove arrays from has keys and trim whitespace
   artist = Hash[artist.map{ |k,v| [k.to_sym, v[0].to_s == '{}' ? nil : v[0].to_s.strip]} ]
   Artist.create! artist
 end
end