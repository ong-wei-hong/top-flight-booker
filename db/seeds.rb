# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.create(code: 'SFO')
Airport.create(code: 'NYC')

5.times { |i| Flight.create(from_airport_id: 1, to_airport_id: 2, start_datetime: DateTime.now.change(day: i + 1), flight_duration: i + 1) }
5.times { |i| Flight.create(from_airport_id: 2, to_airport_id: 1, start_datetime: DateTime.now.change(month: i + 1), flight_duration: i + 1) }
5.times { |i| Flight.create(from_airport_id: 1, to_airport_id: 1, start_datetime: DateTime.now.change(hour: i + 1), flight_duration: i + 1) }
5.times { |i| Flight.create(from_airport_id: 2, to_airport_id: 2, start_datetime: DateTime.now.change(min: i + 1), flight_duration: i + 1) }
