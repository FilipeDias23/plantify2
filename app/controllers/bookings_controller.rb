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
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @plant = Plant.find(params[:plant_id])

    @booking.plant = @plant
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:message)
  end
end
