class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :screen_name
      t.string :username
      t.string :email
      t.string :password
      t.string :password_confirm
      t.string :language
      t.datetime :last_login
      t.string :last_ip

      t.timestamps
    end
  end
end
