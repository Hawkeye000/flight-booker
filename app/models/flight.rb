class Flight < ActiveRecord::Base
  belongs_to :to_airport, class_name:"Airport"
  belongs_to :from_airport, class_name:"Airport"

  def self.all_dates
    (self.all.collect { |x| x.datetime.to_date } ).uniq.sort
  end
end
