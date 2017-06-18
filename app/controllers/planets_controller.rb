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
    if @planet.update(planet_params)
      render json: @planet
    else
      render_error(@planet)
  end

  def destroy
    @planet.destroy
    render json: { message: 'removed' }, status: :ok
  end

private
  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planet_params
  params.require(:planet).permit(:name, :description)
  end  
end
