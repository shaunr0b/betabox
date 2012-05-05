class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :subdomain
      t.string :name
      
      t.timestamps
    end
    
    add_index :accounts, :subdomain, unique: true
    
  end
end
