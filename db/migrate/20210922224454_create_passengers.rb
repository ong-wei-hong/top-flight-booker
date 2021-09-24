class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.belongs_to :booking

      t.timestamps
    end
  end
end
