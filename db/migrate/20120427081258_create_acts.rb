class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :name
      t.string :photo
      t.string :inventory
      t.string :price_range
      t.string :line
      t.text :description
      t.timestamps
    end
  end
end
