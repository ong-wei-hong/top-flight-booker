class BookingsController < ApplicationController
  def new
    @booking = Flight.find(new_params[:id]).bookings.build
    new_params[:number_of_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Flight.find(create_params[:id]).bookings.create
    passengers = Array.new(create_params[:number_of_passengers].to_i) { |i| @booking.passengers.build(create_params[:passengers_attributes][i.to_s]) }

    respond_to do |format|
      if passengers.all? { |passenger| passenger.valid? }
        @booking.save
        passengers.each do |passenger|
          passenger.save
          PassengerMailer.with(user: passenger, id: @booking.id).thank_you_email.deliver_later
        end
        format.html { redirect_to(@booking, notice: 'Your booking is successful') }
      else
        Booking.delete(@booking)
        format.html { redirect_to(new_booking_path(flight: { id: create_params[:id], number_of_passengers: create_params[:number_of_passengers] }), alert: 'Error please try again')}
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def new_params
    params.require(:flight).permit(:id, :number_of_passengers)
  end

  def create_params
    params.require(:booking).permit({ passengers_attributes: [:name, :email] }, :id, :number_of_passengers)
  end
end
