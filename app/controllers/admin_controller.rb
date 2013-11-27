class AdminController < ApplicationController
  def index
    @image_groups = ImageGroup.order("weight_factor asc").where(" category_id = 1 ").page(1) 
    @categorys = Category.all

    @images = Image.page(1).per(10)
  end
end
