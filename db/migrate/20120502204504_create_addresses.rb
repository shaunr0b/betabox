class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :addressable_id
      t.string :addressable_type
      t.string :tag # label for this address
      t.string :name # name of person or business
      t.string :line_1 # 123 Main St
      t.string :line_2 # Apartment 420
      t.string :city # New York
      t.string :state # NY
      t.string :postal_code # 12345
      
      t.timestamps
    end
  end
end
