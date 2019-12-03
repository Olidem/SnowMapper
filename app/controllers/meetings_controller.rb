class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[edit update destroy]
  before_action :set_group, only: %i[new create]

  def index #to be deleted after. For Dev and testing purposes.
    @meetings = Meeting.geocoded
    @markers = @meetings.map do |meeting|
      {
        lat: meeting.latitude,
        lng: meeting.longitude
      }
    end
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.group = @group
    @meeting.user = current_user
    if @meeting.save!
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit() end

  def update
    @group = @meeting.group
    @meeting.user = current_user
    if @meeting.update(meeting_params)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group = @meeting.group
    @meeting.destroy
    redirect_to group_path(@group)
  end

  private

  def meeting_params
    params.require(:meeting).permit(:address, :meeting_date, :description, :latitude, :longitude)
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
