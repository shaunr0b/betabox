class CreateCreditCards < ActiveRecord::Migration
  # Note: this is a stub class, in production will be swapped out for 3rd party browser
  def change
    create_table :credit_cards do |t|
      t.string :encrypted_number
      t.string :type
      t.string :exp_month
      t.string :exp_year
      
      t.references :customer

      t.timestamps
    end
  end
end
