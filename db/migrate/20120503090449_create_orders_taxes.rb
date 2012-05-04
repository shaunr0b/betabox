class CreateOrdersTaxes < ActiveRecord::Migration
  def change
    create_table :orders_taxes do |t|
      t.references :order
      t.references :tax
    end
  end
end
