class CreateActsArtists < ActiveRecord::Migration
  def change
    create_table :acts_artists do |t|
      t.integer :artist_id
      t.integer :act_id
    end
  end
end
