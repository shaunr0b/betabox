class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :tag
      t.string :bio
      t.string :photo
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
