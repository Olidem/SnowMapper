class MeetingsController < ApplicationController

def index
  @meetings = Meeting.all #to be deleted for dev purposes
end

def new
  @meeting = Meeting.new
  @group = Group.find(params[:group_id])
  @user = @meeting.user
end

def create
  @meeting = Meeting.new(group_params)
  @resort = Resort.find(params[:resort_id])
  @group.resort = @resort
  if @group.save!
    Membership.create(user: current_user, group: @group, admin: true)
    redirect_to groups_path
  else
    render :new
  end
end

# def edit

# end

# def update

# end

# def destroy

# end
end
