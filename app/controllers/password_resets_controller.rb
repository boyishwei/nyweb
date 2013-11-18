class PasswordResetsController < ApplicationController
  def new
	
  end
  
  def create
  user = User.find_by_email(params[:email])
  #user.send :send_password_reset if user
  user.send_password_reset if user
  flash[:notice] = "邮件已经发送，请登录到邮箱进行密码重置，该重置有效时长为两个小时，请在两个小时之内完成密码重置"
  render "new"
end

def edit
  @user = User.find_by_password_reset_token!(params[:id])
end

def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hours.ago
    redirect_to new_password_reset_path, :alert => "该密码重置请求已经过期"
  elsif @user.update_attributes(params[:user])
    redirect_to root_url, :notice => "密码重置成功"
  else
    render :edit
  end
end
end
