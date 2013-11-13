class ModifySomeColumns < ActiveRecord::Migration
  def up
	change_column :users, :admin, :boolean, default:false
	change_column :image_groups, :enabled,:boolean , default:false
  end

  def down
  end
end
