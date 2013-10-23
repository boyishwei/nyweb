class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :image_id
      t.integer :user_id
      t.string :comment
      t.integer :parent_id

      t.timestamps
    end
  end
end
