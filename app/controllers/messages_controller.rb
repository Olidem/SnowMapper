class MessagesController < ApplicationController
  def index
  end

  def show
    @group = Group.find(params[:group_id])
    redirect_to group_path(@group)
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
          name: @message.user.first_name,
          group_name: @message.group.name,
          photo: @message.user.photo.key,
          id: @message.id
      }})
    else
      render :new
    end
  end

  def edit
  end

  def update
    @message = Message.find(params[:id])
    @group = @message.group
    if @message.update(message_params)
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @group = @message.group
    @message.show = false
    if @message.save
      Pusher.trigger('comment-channel','delete-comment', {
        message: {
          id: @message.id
      }})
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
