class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.string :is_cc
      t.string :is_cash

      t.timestamps
    end
  end
end
