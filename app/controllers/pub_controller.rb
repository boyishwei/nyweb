class PubController < ApplicationController
  include SessionsHelper
  #puts signed_in?.to_s + "<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>"
  @user
  @auth_code

  def get_current_user
@user = (signed_in?) ? current_user : User.new
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
       @user = (signed_in?) ? current_user : User.new
  end

  def cate
 	get_current_user 
  end

  def fab
 	get_current_user 
  end

  def tour
 	get_current_user 
  end

  def beauty
 	get_current_user 
  end

  def mircopost
 	get_current_user 
  end

  def sos
 	get_current_user 
  end

  def agent
 	get_current_user 
  end

  def sendSMS
  	@auth_code=123223
 	puts @auth_code
 	respond_to do |format|
                format.html { render nothing: true }
                format.js {}
        end
  end
 
  def render_404
	puts "404 error, received url not correct"
	respond_to do |format|
                format.html { render "public/404.html", layout: false }
                format.js {}
        end
  end
end
