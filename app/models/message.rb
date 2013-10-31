class Message < ActiveRecord::Base
  attr_accessible :message, :parent_id, :reply_flag, :user_id, :anonymous
  belongs_to :user
  paginates_per 10
end
