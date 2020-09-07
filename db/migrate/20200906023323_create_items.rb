class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,     null: false
      t.string :detail,        null: false
      t.references :user,      foreign_key: true
      t.integer :category_id,            null: false
      t.integer :status_id,              null: false
      t.integer :shipping_charge_id,     null: false
      t.integer :shipping_region_id,     null: false
      t.integer :date_shipment_id,       null: false
      t.integer :price,                  null: false
      
      t.timestamps
    end
  end
end
