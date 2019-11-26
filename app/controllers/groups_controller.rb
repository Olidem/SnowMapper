class GroupsController < ApplicationController
  # before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all #to be deleted after
  end

  def show
    @group = Group.find(params[:id])
    @resort = @group.resort
    @message = Message.new
  end

  def new
    @group = Group.new
    @resort = Resort.find(params[:resort_id])
    @membership = Membership.new(user: current_user, group: @group, admin: true)
  end

  def create
    @group = Group.new(group_params)
    @group.resort = @resort
    @group.membership.user = current_user
    @messages = @group.messages.content

    # if @group.save!
    #   redirect_to group_path(@group)
    # else
    #   render 'groups/show'
    # end
  end

  # def edit() end

  # def update
  #   @flat.update(flat_params)
  #   redirect_to flat_path
  # end

  # def destroy
  #   @flat.destroy
  #   redirect_to flats_path
  # end

private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  # def set_group
  #   @group = Group.find(params[:id])
  # end
end
