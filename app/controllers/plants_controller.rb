class PlantsController < ApplicationController
  # Filter
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    @plants = Plant.all
  end

  def show
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.save

    if @plant.save
      redirect_to plants_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :type, :description, :image_url, :care_level, :location)
  end
end
