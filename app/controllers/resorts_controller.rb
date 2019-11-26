class ResortsController < ApplicationController
  before_action :set_resort, only: %i[show add_user sort_user_count]
  before_action :set_groups, only: %i[show add_user sort_user_count]

  def index
    @resorts = Resort.all
  end

  def show
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

  private

  def set_resort
    @resort = Resort.find(params[:id])
  end

  def set_groups
    @groups = @resort.groups
  end
end
