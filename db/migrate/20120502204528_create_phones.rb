class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :tag
      
      t.string :number
      t.string :country_code
      t.string :locality_code #area_code in us
      t.string :local_number
      t.integer :phonable_id
      t.string :phonable_type

      t.timestamps
    end
    
    add_index :phones, :number # don't make this unique!
    
  end
end
