class BookingsController < ApplicationController

  def index
    redirect_to root_path
  end

  def new
    @booking = Booking.new(flight_id:params[:flight_id])

    params[:passenger_quantity].to_i.times do
       @booking.passengers.build
    end
  end

end
