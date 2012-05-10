class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.string :description
      t.decimal :price
      t.references :order 
      t.references :product
      t.timestamps
    end
  end
end
