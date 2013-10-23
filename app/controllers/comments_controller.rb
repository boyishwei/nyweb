class CommentsController < ApplicationController
  def create
	if !signed_in?
		puts "not logged in"	
	end
	@comment = Comment.new(params[:comment])
	if signed_in?
		@comment.user_id = current_user.id
	else
		puts "run here"
		@comment.errors.add(:notsignedin, "请先登录再发表评论!")
		puts @comment.errors.full_messages
		return
	end

	puts "====>>>>>>>>>>>>>>>>>>"
	puts @comment.to_s	
	@comment.save
	
	@comments = @comment.image.comments.order("id desc")
  end

  def show
	#notice, the params[:id] here is not a comment id, even the url is comments/:id, but actually, it's a image id passed in
	@image = Image.find(params[:id])
	@comments = @image.comments.order("id desc")
  end

  def destroy
	@comment = Comment.find(params[:id])
	puts @comment.comment
	puts @comment.id
	@comment.destroy

	@comments = @comment.image.comments.order("id desc")
	puts @comment.errors.full_messages
  end
end
