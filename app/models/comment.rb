class Comment < ActiveRecord::Base
  attr_accessible :comment, :image_id, :parent_id, :user_id
  belongs_to :image
  belongs_to :user

  validates :comment, presence: { message:"评论内容不能为空!" }
end
