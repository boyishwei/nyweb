class SessionsController < ApplicationController

	include SessionsHelper
	def new
		@title = "Sign in"
	end

	def create
		@user = User.find_by_username(params[:user][:username]);
	#user = User.find(:all,:conditions=>["username=? and password_digest=password(?)",params[:user][:username],params[:user][:password]])
	
	if @user&&@user.authenticate(params[:user][:password])
		flash[:success] = '欢迎来到宁优网:'
		sign_in @user
	else
		@user=User.new
		@user.errors.add("登录失败","用户名密码错误")
	end
	puts signed_in?.to_s + ">>>>"
	#render :js => 'alert(111); #$("#user_zone").html("<%= j render partial:"users/login", locals:{ user: user } %>");'
	respond_to do |format|
		format.html { redirect_to root_path }
		format.js {} 
	end
end

def destroy
	sign_out
	redirect_to root_path
end
end
