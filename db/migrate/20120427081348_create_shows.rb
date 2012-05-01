class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :name_alt
      t.decimal :price
      t.integer :inventory
      t.integer :act_id 

      t.timestamps
    end
  end
end
