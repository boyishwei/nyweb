class User < ActiveRecord::Base
  attr_accessible :address, :email, :password, :phone, :username
end
