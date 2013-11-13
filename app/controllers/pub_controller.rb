class PubController < ApplicationController
  include SessionsHelper
  #puts signed_in?.to_s + "<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>"
  @user
  @auth_code

  def get_current_user
	@user = (signed_in?) ? current_user : User.new
  end

  def getImageGroup(category_id)
	if category_id == nil
		category_id = 1
	end
	ImageGroup.order("weight_factor asc").where(" enabled = true and category_id = '#{category_id}'").page(1)
  end

  def index
 	get_current_user 
  end

  def about
 	get_current_user 
  end

  def contact
 	get_current_user 
  end

  def recruit
 	get_current_user 
  end

  def ba
 	get_current_user 
  end

  def edu
	get_current_user
	@groups = getImageGroup(1)
	@comments = Comment.page(params[:page])
	
	@groups.each do |g|
		puts g.group_name
	end
  end

  def cate
 	get_current_user 
	@groups = getImageGroup(2)
  end

  def fab
 	get_current_user 
	@groups = getImageGroup(6)
  end

  def tour
 	get_current_user 
	@groups = getImageGroup(3)
  end

  def beauty
 	get_current_user 
	@groups = getImageGroup(4)
  end

  def entertainment
 	get_current_user 
	@groups = getImageGroup(5)
  end 

  def sos
 	get_current_user 
	@groups = getImageGroup('sos')
  end

  def show
        get_current_user
        @groups = getImageGroup(7)
  end

  def decoration
 	get_current_user 
	@groups = getImageGroup(8)
  end
  
  def promotion
        get_current_user
        @groups = getImageGroup(9)
  end
  
  def sendSMS
  	@auth_code=123223
 	puts @auth_code
 	respond_to do |format|
                format.html { render nothing: true }
                format.js {}
        end
  end
  
  def showSlideModal
	#simulate a fake group
	@group = ImageGroup.find(params[:id])
	puts @group.id
	
	@images = @group.images.order("weight_factor asc")
	
	first_image_id = @images.first.id	
	@comments = @images.first.comments.order("id asc").page(1)

	@images.each {|i| puts i.location}
  end
 
  def showSlideModalFake
	#simulate a fake group
	@group = ImageGroup.find(5)
	puts @group.id
	
	@images = @group.images.order("weight_factor asc")
	
	first_image_id = @images.first.id	
	@comments = @images.first.comments.order("id asc").page(1)

	@images.each {|i| puts i.location}
  end
 
  def admin
	@image_groups = getImageGroup(1)
	@categorys = Category.all
	puts @image_groups.size
  end

  def gravatar
  end
 
  def render_404
	puts "404 error, received url not correct"
	respond_to do |format|
                format.html { render "public/404.html", layout: false }
                format.js {}
        end
  end
end
