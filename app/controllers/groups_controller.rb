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
  end

  def create
    @group = Group.new(group_params)
    @resort = Resort.find(params[:resort_id])
    @group.resort = @resort
    if @group.save!
      Membership.create(user: current_user, group: @group, admin: true)
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  # def update
  #   @group = Group.find(params[:id])
  #   @resort = @group.resort
  #   if @group.update(group_params)
  #     redirect_to group_path(@group)
  #   else
  #     render :edit
  #   end
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
