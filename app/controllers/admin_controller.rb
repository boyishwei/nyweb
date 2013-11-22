class AdminController < ApplicationController
  def index
    @image_groups = ImageGroup.order("weight_factor asc").where(" category_id = 1 ").page(1) 
    @categorys = Category.all
  end
end
