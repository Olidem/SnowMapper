class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_footer = true
    @disable_navbar = true
    @countries = Country.all
    @resorts = Resort.all
    # raise
    @resorts_hash = {}
    resorts = Resort.all
    resorts.each do |resort|
      if @resorts_hash[resort.country.id.to_s]
        @resorts_hash[resort.country.id.to_s] << resort.id
      else
        @resorts_hash[resort.country.id.to_s] = [resort.id]
      end
    end

  end
end









