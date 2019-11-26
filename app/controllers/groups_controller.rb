class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.all #to be deleted after. For Dev and testing purposes.
  end

  def show
    @resort = @group.resort
    @message = Message.new

    @meetings = @group.meetings.geocoded #returns flats with coordinates

    @markers = @meetings.map do |meeting|
      {
        lat: meeting.latitude,
        lng: meeting.longitude
      }
    end
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

  def edit() end

  def update
    @resort = @group.resort
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
