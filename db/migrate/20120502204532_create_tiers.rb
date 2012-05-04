class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.string :tag # e.g. General Admission
      
      t.string :description
      t.decimal :price
      t.integer :inventory
      t.integer :starting_inventory
      
      t.references :show

      t.timestamps
    end
  end
end
