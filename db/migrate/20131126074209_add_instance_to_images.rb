class AddInstanceToImages < ActiveRecord::Migration
  def change
    add_column :images, :instance, :string
  end
end
