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
    @user.errors.add("验证失败","验证码输入错误")
    puts @user.errors.full_messages
    render "new"
    #respond_to do |format|
    #format.html { render action: "new" } 
    return
  end
  puts "1111:" + signed_in?.to_s
 
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
      puts @user.errors.full_messages
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

  respond_to do |format|
    if @user.update_attributes(params[:user])
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
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
