class CharactersController < ApplicationController
  before_action :set_planet, only: [:index, :create]
  before_action :set_character, only: [:show, :update, :destroy]

  def index
   render json: @planet.characters
  end

  def show
    render json: @character
  end

  def create
    @character = @planet.characters.new(character_params)
    if @character.save
      render json: @character
    else
      render_error(@character)
    end
  end

  def update
    if @character.update(character_params)
      render json: @character
    else
      render_error(@character)
    end
  end

  def destroy
   @character.destroy
   render json: { message: 'removed' }, status: :ok
  end

private
  def set_planet
    @planet = Planet.find(params[:planet_id])
  end

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :vehicle)
  end
end
