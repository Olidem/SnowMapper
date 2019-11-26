class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @message = Message.new
    @user = current_user
  end
end
