class ChangeColumnNameOnImageGroups < ActiveRecord::Migration
  def up
	rename_column :image_groups, :category, :category_id
  end

  def down
	rename_column :image_groups, :category_id, :category
  end
end
