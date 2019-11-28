class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_footer = true
    @disable_navbar = true
  end
end
