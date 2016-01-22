class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references  :cart, null: false
      t.references  :item, null: false

      t.timestamps null: false
    end
  end
end
