class StaticPageController < ApplicationController
  def home
    render json: 'Welcome to Illnest\'s API'
  end
end
