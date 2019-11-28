class CountriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
    @resorts = Resort.where(country_id: params[:id])
    @marker = {
        lat: 45.397395,
        lng: 6.634884
      }
  end
end
