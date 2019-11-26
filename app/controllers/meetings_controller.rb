class MeetingsController < ApplicationController
# before_action :set_meeting, only: %i[show edit update destroy]

def index
  @meetings = Meeting.all #to be deleted for dev purposes
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
    redirect_to meetings_path
  else
    render :new
  end
end

def edit
  @meeting = Meeting.find(params[:id])
end

def update

end

# def destroy

# end

  private

  def meeting_params
    params.require(:meeting).permit(:address, :meeting_date)
  end

  # def set_meeting
  #   @group = Group.find(params[:id])
  # end
end
