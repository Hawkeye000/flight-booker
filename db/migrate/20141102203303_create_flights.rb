class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :from_airport, index: true
      t.references :to_airport, index: true
      t.datetime :datetime
      t.integer :duration #stored in seconds

      t.timestamps
    end
  end
end
