class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new(flight_id:params[:flight_id])

    params[:passenger_quantity].to_i.times do
       @booking.passengers.build
    end
  end

  def create
    if @booking = Booking.create(booking_params)
      redirect_to @booking
    else
      render 'new'
    end
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end

end
