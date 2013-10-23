class CreateImageGroups < ActiveRecord::Migration
  def change
    create_table :image_groups do |t|
      t.string :group_name
      t.string :category
      t.integer :cover_image_id
      t.boolean :enabled
      t.string :key_word
      t.string :desc
      t.integer :weight_factor

      t.timestamps
    end
  end
end
