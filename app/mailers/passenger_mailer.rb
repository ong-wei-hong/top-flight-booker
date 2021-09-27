class PassengerMailer < ApplicationMailer
  default from: 'notifications@flightbooker.com'

  def thank_you_email
    @user = params[:user]
    @url = "localhost:3000/bookings/#{params[:id]}"
    mail(to: @user.email, subject: 'FlightBooker thanks you')
  end
end
