class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "type" # for STI
      t.integer  "account_id"

      t.string   "username", :null => false
      t.string   "email", :null => false
      t.string   "password", :null => false

      t.string   "prefix"
      t.string   "first_name"
      t.string   "mi"
      t.string   "last_name"
      t.string   "suffix"
      t.string   "screen_name"

      t.string  "company_name"

      t.string   "language"
      t.datetime "last_login"
      t.string   "last_ip"
      
      t.integer "role_id", :null => :false, :default => 4
      # 1. owner  2. manager  3. employee  4. customer 

      t.timestamps
    end
    
    add_index(:users, :email, unique: true)
  end
end
