class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :fieldable_id
      t.string :fieldable_type
      
      t.integer :parent_id, :null => false
      
      t.string :slug # field identifier
      
      t.string :value_string
      t.text :value_text
      t.integer :value_integer
      t.decimal :value_decimal
      t.boolean :value_boolean
      t.datetime :value_datetime
      
      t.timestamps
    end
    add_index :fields, :slug, unique: true
    
  end
end
