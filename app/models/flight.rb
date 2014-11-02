class Flight < ActiveRecord::Base
  has_one :to_airport, as: :airport
  has_one :from_airport, as: :airport
end
