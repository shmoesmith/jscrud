class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :update, :destroy]

  def index
    @planets = Planet.all
  end

  def show
  end

  def create
    @planet = Planet.new(planet_params)
    if @planet.save
      render json: @planet
    else
      render_error(@planet)
    end
  end

  def update
  end

  def destroy
  end
end
