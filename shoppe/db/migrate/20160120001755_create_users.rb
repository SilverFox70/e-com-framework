class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.integer :user_type, :null => false

      t.timestamps null: false
    end
  end
end
