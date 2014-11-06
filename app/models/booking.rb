class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers
  validates_associated :passengers
end
