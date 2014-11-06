class Flight < ActiveRecord::Base
  belongs_to :to_airport, class_name:"Airport"
  belongs_to :from_airport, class_name:"Airport"
  has_many :bookings, dependent:destroy_all
  attr_accessor :flight_id

  def self.all_dates
    (self.all.collect { |x| x.date } ).uniq.sort
  end

  def self.search(params = {})
    self.select do |flight|
      params[:to_airport_id] == flight.to_airport_id.to_s &&
      params[:from_airport_id] == flight.from_airport_id.to_s &&
      params[:date] == flight.date
    end
  end

  def date
    self.datetime.to_date.to_s(:db)
  end

  def to_s
    "#{self.from_airport.code} -> #{self.to_airport.code} " +
    "on #{self.date} dur #{(self.duration/3600.0).to_f.round(1)} hours"
  end

end
