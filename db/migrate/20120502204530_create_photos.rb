class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :tag
      
      t.string :url
      t.string :caption
      t.string :credit
      
      t.integer :photoable_id
      t.string :photoable_type

      t.timestamps
    end
  end
end
