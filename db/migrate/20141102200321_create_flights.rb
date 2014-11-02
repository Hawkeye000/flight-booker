class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references, :from_airport
      t.references, :to_airport
      t.datetime, :datetime
      t.time :duration

      t.timestamps
    end
  end
end
