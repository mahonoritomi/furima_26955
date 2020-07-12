class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image,          null: false
      t.string :name,           null: false, index: true
      t.text :explanation,      null: false
      t.integer :category_id,      null: false, index: true
      t.integer :condition_id,     null: false
      t.integer :delivery_fee_id,  null: false
      t.integer :ship_from_id,     null: false
      t.integer :transport_days_id,  null: false
      t.integer :price,          null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
