class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :name
      t.decimal :flat_amount
      t.decimal :percentage

      t.timestamps
    end
  end
end
