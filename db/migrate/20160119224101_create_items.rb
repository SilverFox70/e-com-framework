class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :quantity
      t.string :picture_url
      t.string :upc

      t.timestamps null: false
    end
  end
end
