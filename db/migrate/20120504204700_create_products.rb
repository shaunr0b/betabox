class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug, :null => false
      t.integer :inventory, :null => false, :default => 0
      
      t.string :short_description
      t.text :long_description
      
      t.integer :heir_id
      t.string :heir_type
      
      t.decimal :price, :null => false, :default => 0.00
      t.integer :product_group_id
      
      t.string :type

      t.timestamps
    end
    add_index :products, :slug, unique: true
    
  end
end
