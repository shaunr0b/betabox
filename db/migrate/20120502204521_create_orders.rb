class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer
      
      t.integer :billing_address_id
      t.integer :shipping_address_id

      t.timestamps
    end
  end
end
