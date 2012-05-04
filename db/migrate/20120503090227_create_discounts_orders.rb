class CreateDiscountsOrders < ActiveRecord::Migration
  def change
    create_table :discounts_orders do |t|
      t.integer :discount_id
      t.integer :order_id
    end

  end
end
