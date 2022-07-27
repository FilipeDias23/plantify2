class BookingsController < ApplicationController
  #TODO index, show, new, create

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @plant = Plant.find(params[:plant_id])
    @booking = Booking.new
    @booking.user = current_user
    @booking.plant = @plant
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @plant = Plant.find(params[:plant_id])
    @booking.user = current_user
    @booking.plant = @plant
    authorize @booking
    if @booking.save!
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
    authorize @bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:message)
  end
end
