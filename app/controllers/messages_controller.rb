class MessagesController < ApplicationController
  def new
	@message = Message.new
  end

  def create
  	@message = Message.new(:message=>params[:message][:message])
	puts params[:input][:anonymous]
	if params[:input][:anonymous] == "0"
		if !signed_in?
			@message.errors.add(:base, "请先登录后再留言，或者选择匿名留言(无需登录)。")
			#format.html { render action: "new" } 
			return
		else
			@message.user_id = current_user.id
		end
	elsif
		@message.user_id = nil
	end

	@message.save
	respond_to do |format|
      		format.js {}
	end	
  end
	
  def index
	@messages = Message.order('created_at desc').page(params[:page])
	#@messages.order("id desc")
  end
	
  def destroy
	puts params[:id]	
	@message = Message.find(params[:id])
	@message.destroy

        respond_to do |format|
      		format.html { redirect_to messages_url }
      		format.json { head :no_content }
    	end
  end
end
