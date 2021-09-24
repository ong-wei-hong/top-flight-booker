class Airport < ApplicationRecord
  has_many :departing_flights, foreign_key: 'from_airport_id', class_name: 'Flight'
  has_many :arriving_flights, foreign_key: 'to_airport_id', class_name: 'Flight'

  def self.id_with_code(id)
    return Airport.all.where("code = ?", id).ids[0]
  end
end
