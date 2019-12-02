class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy count_messages]
  after_action :count_messages, only: [:show]

  # For Dev and testing purposes
  # def index
  #   @groups = Group.all
  # end

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

  def count_messages
    if (@read_message = ReadMessage.find_by(user: current_user, group: @group))
      @read_message.update(no_of_read_messages: @group.messages.count)
    else
      @read_message = ReadMessage.new(no_of_read_messages: @group.messages.count)
      @read_message.user = current_user
      @read_message.group = @group
      @read_message.save!
    end
  end

  def group_params
    params.require(:group).permit(:name, :description, :photo, :locked)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
