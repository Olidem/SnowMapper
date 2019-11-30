class ResortsController < ApplicationController
  before_action :set_resort, only: %i[show add_user sort_user_count sort_group_created sort_latest_message]
  before_action :set_groups, only: %i[show add_user sort_user_count sort_group_created sort_latest_message]
  before_action :set_empty_group, only: %i[show sort_user_count sort_group_created sort_latest_message]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @resorts = Resort.all
  end

  def show
    @membership_request = MembershipRequest.new
  end

  def add_user
    current_user.update(resort: @resort)
    redirect_to resort_path(@resort)
  end

  # Ordering methods
  def sort_user_count
    @groups = (@groups.sort_by { |group| group.users.count }).reverse
    render :show
  end

  def sort_group_created
    @groups = (@groups.sort_by { |group| group.created_at }).reverse
    render :show
  end

  def sort_latest_message
    @groups = (@groups.sort_by { |group| group.messages.any? ? group.messages.last.created_at : Time.new(1) }).reverse
    render :show
  end

  private

  def set_resort
    @resort = Resort.find(params[:id])
  end

  def set_groups
    @groups = @resort.groups.reverse
  end

  def set_empty_group
    @group = Group.new
  end
end
