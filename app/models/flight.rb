class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'
  has_many :bookings

  def self.search(search)
    flights = Flight.all
    unless search.empty?
      unless search[:from_airport] == ''
        flights = flights.where("from_airport_id = ?", Airport.where("code = ?", search[:from_airport]).ids[0])
      end
      unless search[:to_airport] == ''
        flights = flights.where("to_airport_id = ?", Airport.where("code = ?", search[:to_airport]).ids[0])
      end
      unless search[:date] == ''
        flights = flights.where('start_datetime LIKE ?', "#{search[:date]}%")
      end
    end
    flights
  end

  def label
    "From #{Airport.find(self.from_airport.id).code} to #{Airport.find(self.to_airport_id).code} at #{self.start_datetime} for #{duration}"
  end

  private

  def duration
    time = self.flight_duration
    if time == 1
      '1 hour'
    else
      "#{time} hours"
    end
  end
end
