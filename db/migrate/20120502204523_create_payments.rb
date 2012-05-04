class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      
      t.decimal :amount
      t.integer :payment_method_id
      
      t.string :transaction_id
      t.references :order
      
      t.timestamps
    end
  end
end
