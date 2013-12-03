class UsersController < ApplicationController

include SessionsHelper

# GET /users
# GET /users.json
def index
  @users                      = User.all

  respond_to do |format|
  format.html # index.html.erb
  format.json { render json: @users }
end
end

# GET /users/1
# GET /users/1.json
def show
  @user                       = User.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @user }
  end
end

# GET /users/new
# GET /users/new.json
def new
  @user                       = User.new

  respond_to do |format|
format.html # new.html.erb
format.json { render json: @user }
end
end

# GET /users/1/edit
def edit
  @user                       = User.find(params[:id])
end

# POST /users
# POST /users.json
def create
  @user = User.new(params[:user])
  
  if params[:auth][:authCode] != params[:auth][:hiddenAuthCode]
    @user.errors.add(:authcode,"短信验证码输入不正确")
    puts @user.errors.count
    #respond_to do |format|
    #format.html { render action: "new" } 
    return
  end
 
  respond_to do |format|
    if @user.save
      sign_in @user
      puts "success!"
      puts "2222:" + signed_in?.to_s
      format.html { redirect_to root_path }
      format.json { render json: @user, status: :created, location: @user }
      format.js {}
    else
      puts "save user failed"
      puts @user.errors.count
      puts @user.errors.full_messages
      #puts @user.errors.get(:username)

      format.html { render action: "new" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
      format.js {}
      #format.js { render :partial => 'users/login', :locals => { :user => @user }}
    end
  end
end

# PUT /users/1
# PUT /users/1.json
def update
  @user                       = User.find(params[:id])
  p @user.avatar.url
  respond_to do |format|
    if @user.update_attributes(params[:user])
      format.html { redirect_to @user, notice: '用户信息更新成功！' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

def updatePWD
	if signed_in?
		@user = current_user
		if params[:user][:password].blank? || params[:user][:password_confirmation].blank?
			@user.errors.add(:password, "密码及确认密码不能为空.")
		elsif   @user.authenticate(params[:user][:old_password])
			@user.password = params[:user][:password]
			@user.password_confirmation = params[:user][:password_confirmation]
			@user.save
		else
			@user.errors.add(:password_incorrect, "旧密码输入不正确，请确认.")
			puts "更改密码失败"
		end
	elsif
		@user = User.new
		@user.errors.add(:not_signed_in, "您尚未登录，请先登录再尝试修改密码.")
	end

	respond_to do |format|
      		format.html { redirect_to @user, notice: 'User was successfully updated.' }
      		format.json { head :no_content }
      		format.js   {}
   	end
	
end

def updateEmail
        if signed_in?
                @user = current_user
                @user.email = params[:user][:email]
		puts @user.email
		puts @user.valid?
		if @user.valid?
			@user.update_attribute(:email,params[:user][:email])
		end
        elsif
                @user = User.new
                @user.errors.add(:not_signed_in, "您尚未登录，请先登录再尝试修改.")
        end

        respond_to do |format|
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
                format.json { head :no_content }
                format.js   {}
        end

end

def updateAddress
        if signed_in?
                @user = current_user
                @user.address = params[:user][:address]
                puts @user.address
                puts @user.valid?
                if @user.valid?
                        @user.update_attribute(:address,params[:user][:address])
                end
        elsif
                @user = User.new
                @user.errors.add(:not_signed_in, "您尚未登录，请先登录再尝试修改.")
        end

        respond_to do |format|
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
                format.json { head :no_content }
                format.js   {}
        end

end

def updatePhone
        if signed_in?
                @user = current_user
                @user.phone = params[:user][:phone]
		
		if params[:auth][:authCode].blank?
                        @user.errors.add(:authcode,"请输入验证码")
                        return
                end
        	
		if params[:auth][:authCode] != params[:auth][:hiddenAuthCode] 
			@user.errors.add(:authcode,"短信验证码输入不正确")
                	return
        	end
                
		if @user.valid?
                        @user.update_attribute(:phone,params[:user][:phone])
                end
        elsif
                @user = User.new
                @user.errors.add(:not_signed_in, "您尚未登录，请先登录再尝试修改.")
        end

        respond_to do |format|
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
                format.json { head :no_content }
                format.js   {}
        end

end

# DELETE /users/1
# DELETE /users/1.json
def destroy
  @user                       = User.find(params[:id])
  @user.destroy

  respond_to do |format|
    format.html { redirect_to users_url }
    format.json { head :no_content }
  end
end
end
