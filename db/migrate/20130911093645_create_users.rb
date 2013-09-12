class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.string :email
      t.decimal :phone
      t.string :address

      t.timestamps
    end
  end
end
