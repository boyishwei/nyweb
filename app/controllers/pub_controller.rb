class PubController < ApplicationController
  include SessionsHelper
  #puts signed_in?.to_s + "<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>"
  @user
  @auth_code

  def get_current_user
	@user = (signed_in?) ? current_user : User.new
  end

  def getImageGroup(category)
	ImageGroup.order("weight_factor desc").where("category = '#{category}'").page(1)
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
	@groups = getImageGroup('edu')
	@comments = Comment.page(params[:page])
	
	@groups.each do |g|
		puts g.group_name
	end
  end

  def cate
 	get_current_user 
	@groups = getImageGroup('cate')
  end

  def fab
 	get_current_user 
	@groups = getImageGroup('fab')
  end

  def tour
 	get_current_user 
	@groups = getImageGroup('tour')
  end

  def beauty
 	get_current_user 
	@groups = getImageGroup('beauty')
  end

  def entertainment
 	get_current_user 
	@groups = getImageGroup('mircopost')
  end 

  def sos
 	get_current_user 
	@groups = getImageGroup('sos')
  end

  def show
        get_current_user
        @groups = getImageGroup('show')
  end

  def decoration
 	get_current_user 
	@groups = getImageGroup('decoration')
  end
  
  def promotion
        get_current_user
        @groups = getImageGroup('promotion')
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
	@group = ImageGroup.find(1)
	puts @group.id
	
	@images = @group.images.order("weight_factor desc")
	
	first_image_id = @images.first.id	
	@comments = @images.first.comments.order("id desc").page(1)

	@images.each {|i| puts i.location}
  end
 
  def render_404
	puts "404 error, received url not correct"
	respond_to do |format|
                format.html { render "public/404.html", layout: false }
                format.js {}
        end
  end
end
