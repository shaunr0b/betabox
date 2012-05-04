class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.datetime :scanned_at
      
      t.references :tier

      t.timestamps
    end
  end
end
