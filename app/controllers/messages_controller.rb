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
      respond_to do |format|
        format.html { redirect_to group_path(@group) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'groups/show' }
        format.js  # <-- idem
      end
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
