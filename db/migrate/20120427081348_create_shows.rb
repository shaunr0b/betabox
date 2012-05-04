class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :tag # Tuesday at 3pm
      
      t.integer :inventory      
      t.datetime :starts_at
      t.datetime :ends_at
      
      t.references  :act 
      

      t.timestamps
    end
  end
end
