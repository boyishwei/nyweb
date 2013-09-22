module SessionsHelper
    def sign_in(user)
      cookies.permanent[:remember_token]=user.remember_token
      self.current_user=user
	puts "into sign in"
    end

    def current_user=(user)
      @current_user = user
	puts "into initiallize current user"
    end

    def current_user
      @current_user ||= User.find_by_remember_token(cookies[:remember_token])    
	#puts "into initiallize or get user from db via cookies"
	#puts @current_user.nil?
    end

    def signed_in?
	#puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	#puts !current_user.nil?
	#puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      	current_user.nil?
	#puts "into sign jugement"
    end

    def sign_out
      self.current_user = nil
      cookies.delete(:remember_token)
	puts "into sign out"
    end
end
