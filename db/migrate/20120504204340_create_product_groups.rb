class CreateProductGroups < ActiveRecord::Migration
  def change
    create_table :product_groups do |t|
      t.string :name
      t.string :slug
      t.string :short_description
      t.text :long_description
      
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth


      t.timestamps
    end
    
    add_index :product_groups, :slug, unique: true
    
  end
end
