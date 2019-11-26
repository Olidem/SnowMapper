class ResortsController < ApplicationController
  before_action :set_resort, only: %i[show]

  def index
    @resorts = Resort.all
  end

  def show
    @groups = @resort.groups
  end

  private

  def set_resort
    @resort = Resort.find(params[:id])
  end
end
