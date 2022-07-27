class PlantsController < ApplicationController
  # Filter
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    # @plants = Plant.all
    @plants = policy_scope(Plant)
  end

  def show; end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    authorize @plant
    @plant.save
    # In order to create a plant we'll need a User
    @plant.user = current_user
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def edit; end

  def update
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  def my_plants
    @plants = Plant.where(user: current_user)
    authorize @plants
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def plant_params
    params.require(:plant).permit(:name, :plant_type, :description, :image_url, :care_level, :location, :price, :image)
  end
end
