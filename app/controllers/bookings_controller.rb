class BookingsController < ApplicationController
  def new
    @booking = Flight.find(new_params[:id]).bookings.build
    new_params[:number_of_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Flight.find(create_params[:id]).bookings.create
    create_params[:number_of_passengers].to_i.times do |i|
      @booking.passengers.create(create_passenger_params[i.to_s])
    end
    flash.notice = 'Your flight has successfully been booked'
    redirect_to booking_path(Booking.last.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def new_params
    params.require(:flight).permit(:id, :number_of_passengers)
  end

  def create_passenger_params
    params.require(:booking).require(:passengers_attributes).permit!
  end

  def create_params
    params.require(:booking).permit(:id, :number_of_passengers)
  end
end
