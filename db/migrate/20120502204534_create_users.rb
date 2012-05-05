class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "type" # for STI
      t.integer  "company_id"

      t.string   "username"
      t.string   "email"
      t.string   "password"

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

      t.timestamps
    end
  end
end
