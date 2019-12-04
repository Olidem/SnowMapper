class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy count_messages]

  # For Dev and testing purposes
  # def index
  #   @groups = Group.all
  # end

  def show
    @resort = @group.resort
    @message = Message.new

    @meetings = @group.meetings.geocoded #returns flats with coordinates
    # @meetings = @group.meetings #returns flats with coordinates

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
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit() end

  def update
    @resort = @group.resort
    if @group.update(group_params)
      admins = @group.memberships.where(admin: true)
      admins.count.zero? ? destroy : (redirect_to group_path(@group))
    else
      render :edit
    end
  end

  def destroy
    @resort = @group.resort
    @group.destroy
    redirect_to resort_path(@resort)
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :photo, :locked)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
