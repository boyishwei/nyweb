class User < ActiveRecord::Base
  attr_accessible :address, :email, :password, :phone, :user_name
end
