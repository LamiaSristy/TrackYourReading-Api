class StaticPageController < ApplicationController
  def home
    render json: 'Welcome to TrackYourReading\'s API'
  end
end
