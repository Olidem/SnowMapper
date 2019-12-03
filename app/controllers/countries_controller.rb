class CountriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @european_countries = Country.where(continent: "Europe")
    @north_american_countries = Country.where(continent: "North America")
    @row_countries = Country.where(continent: "Rest of the World")
  end

  def show
    @country = Country.find(params[:id])
    @resorts = Resort.where(country_id: params[:id])
    @markers = @resorts.geocoded.map do |resort|
      {
        lat: resort.latitude,
        lng: resort.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { resort: resort }),
        image_url: helpers.asset_url('Skiing-PNG-Image.png')
      }
    end
  end
end
