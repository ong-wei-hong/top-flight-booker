class FlightsController < ApplicationController
  def index
    @flights = Flight.search(search_params)
    @airports = Airport.pluck(:code).sort.unshift("")
    @dates = Flight.pluck(:start_datetime).map(&:to_date).uniq.sort.unshift("")
    if params[:search]
      @from = params[:search][:from_airport]
      @to = params[:search][:to_airport]
      @num = params[:search][:number_of_passengers]
      @selected_date = params[:search][:date]
    end
  end

  private

  def search_params
    params.fetch(:search, {}).permit(:from_airport, :to_airport, :date, :number_of_passengers)
  end
end
