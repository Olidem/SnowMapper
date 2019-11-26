class ResortsController < ApplicationController
  before_action :set_resort, only: %i[show add_user]

  def index
    @resorts = Resort.all
  end

  def show
    @groups = @resort.groups
  end

  def add_user
    current_user.update(resort: @resort)
    @groups = @resort.groups
    redirect_to resort_path(@resort)
  end

  private

  def set_resort
    @resort = Resort.find(params[:id])
  end
end
