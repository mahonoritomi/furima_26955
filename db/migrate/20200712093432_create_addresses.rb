class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :zipcode,      null:false
      t.integer :prefecture,   null:false
      t.string :city,          null:false
      t.string :address_line,  null:false
      t.string :building
      t.integer :phone_number, null:false
      t.references :user,    null:false, foreign_key:true

      t.timestamps
    end
 
  end
end
