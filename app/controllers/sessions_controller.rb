class SessionsController < ApplicationController

	include SessionsHelper
	def new
		@title = "Sign in"
	end

	def create
		user = User.find_by_username(params[:user][:username]);
	#user = User.find(:all,:conditions=>["username=? and password_digest=password(?)",params[:user][:username],params[:user][:password]])
	puts params[:user][:password]
	if user&&user.authenticate(params[:user][:password])
		flash[:success] = '欢迎来到宁优网:'
		sign_in user
	#respond_to do |format|
	 #   format.html { redirect_to root_path }
	  #  format.js { redirect_to root_path }
	#end
else
	puts "=================================================================incorect================="
	flash[:error] = '用户名密码错误!'
	@user =User.new
	#redirect_to root_path
	#render :js=> '$("#error_msg").html("用户名密码错误!");'
end

respond_to do |format|
	format.html { redirect_to root_path }
	format.js
end
end

def destroy
	puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	puts signed_in?
	puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	sign_out
	redirect_to root_path
end
end
