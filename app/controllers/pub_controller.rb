class PubController < ApplicationController
  include SessionsHelper
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
  end
end
