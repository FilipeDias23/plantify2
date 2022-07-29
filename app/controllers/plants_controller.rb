class PlantsController < ApplicationController
  # Filter
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    # @plants = Plant.all
    if params[:query].present?
      @plants = policy_scope(Plant).search_by_location(params[:query])
    else
      @plants = policy_scope(Plant)
    end
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

  # Collections
  def easy
    @plants = Plant.where(care_level: 0)
    authorize @plants
  end

  def near
    if current_user
    @plants = Plant.near(current_user.location)
    else
    @plants = Plant.where(params[:query])
    end
    authorize @plants
  end

  def cheaper
    @plants = Plant.order(:price)
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
