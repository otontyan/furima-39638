class CreateSends < ActiveRecord::Migration[7.0]
  def change
    create_table :sends do |t|
      t.string  :postal_code, null: false
      t.integer :shipping_origin_id, null: false
      t.string  :city, null: false
      t.string  :street_address, null: false
      t.string  :building_name
      t.string  :phone_number, null: false
      t.references  :buy, null: false,foreign_key: true
      t.timestamps
    end
  end
end
