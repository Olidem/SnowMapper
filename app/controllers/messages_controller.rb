class MessagesController < ApplicationController
  def index
  end

  def show

  end

  def new
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(message_params)
    @user = current_user
    @message.user = @user
    @message.group = @group
    if @message.save
      Pusher.trigger('comment-channel','new-comment', {
        message: {
          content: @message.content,
          email: @message.user.email
      }})
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
