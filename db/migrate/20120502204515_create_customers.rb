class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :gender
      t.datetime :birthdate
      
      t.references :user

      t.timestamps
    end
  end
end
