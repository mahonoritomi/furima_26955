class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image,          null: false
      t.string :name,           null: false, index: true
      t.text :explanation,      null: false
      t.integer :category,      null: false, index: true
      t.integer :condition,     null: false
      t.integer :delivery_fee,  null: false
      t.integer :ship_from,     null: false
      t.integer :transport_days,  null: false
      t.integer :price,          null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
