class PubController < ApplicationController
  include SessionsHelper
  #puts signed_in?.to_s + "<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>"
  @user

  def index
	if signed_in?
		@user=current_user
	puts @user.username
	puts ">>>>>>>"
	else
		@user=User.new
	puts "<<<<<<<<<<<"
	end
  end

  def about
  end

  def contact
  end

  def recruit
  end

  def ba
  end

  def edu
       @user = (signed_in?) ? current_user : User.new
  end

  def cate
  end

  def fab
  end

  def tour
  end

  def beauty
  end

  def mircopost
  end

  def sos
  end

  def agent
  end

end
