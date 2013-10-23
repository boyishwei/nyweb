class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_name
      t.integer :group_id
      t.boolean :enabled
      t.string :location
      t.string :key_word
      t.string :desc
      t.integer :weight_factor

      t.timestamps
    end
  end
end
