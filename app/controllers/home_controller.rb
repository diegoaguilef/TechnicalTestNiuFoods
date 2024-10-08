class HomeController < ApplicationController
  def index
    @restaurants = Restaurant.all
    respond_to do |format|
      format.html
      format.json { render json: @restaurants.as_json(methods: [:status]) }
    end

  end
end
