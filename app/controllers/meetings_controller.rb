class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[edit update destroy]

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
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
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
      redirect_to meetings_path
    else
      render :edit
    end
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:address, :meeting_date)
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
end
