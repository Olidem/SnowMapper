class MeetingsController < ApplicationController

def index
  @meetings = Meeting.all #to be deleted for dev purposes
end

# def new
#   @meeting = Meeting.new
#   @group = Group.find(params[:group_id])
#   @user = @meeting.user
# end

def create

end

# def edit

# end

# def update

# end

# def destroy

# end
end
