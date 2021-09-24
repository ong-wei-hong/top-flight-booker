class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.belongs_to :from_airport, foreign_key: { to_table: 'airports' }
      t.belongs_to :to_airport, foreign_key: { to_table: 'airports' }
      t.datetime :start_datetime
      t.integer :flight_duration

      t.timestamps
    end
  end
end
