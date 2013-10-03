class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  puts "run applications>>>>"
  #puts signed_in?
  @user= User.new
  def abc
   @user= (signed_in?) ? current_user : (User.new)
  end
end
