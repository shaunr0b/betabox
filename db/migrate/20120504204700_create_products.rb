class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.decimal :price
      t.integer :product_group_id
      t.string :type

      t.timestamps
    end
    add_index :products, :slug, unique: true
    
  end
end
