class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :item_description, null: false
      t.integer :category, null: false
      t.integer :item_condition, null: false
      t.integer :shipping_cost, null: false
      t.integer :shipping_origin, null: false
      t.integer :days_to_ship, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
