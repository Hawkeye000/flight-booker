class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers
  validates_associated :passengers
  validates_presence_of :flight_id
  validates :passengers, length: { minimum: 1 }
end
