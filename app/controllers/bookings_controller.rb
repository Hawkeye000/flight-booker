class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new(flight_id:params[:flight_id])

    params[:passenger_quantity].to_i.times do
       @booking.passengers.build
    end
  end

  def create

  end

end
