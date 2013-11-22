class AddPromotedToImageGroups < ActiveRecord::Migration
  def change
    add_column :image_groups, :promoted, :boolean, default:false
  end
end
