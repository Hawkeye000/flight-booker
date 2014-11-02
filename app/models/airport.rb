class Airport < ActiveRecord::Base
  validates_presence_of :code
  has_many :departing_flights, foreign_key:"from_airport_id", class_name:"Flight"
  has_many :arriving_flights, foreign_key:"to_airport_id", class_name:"Flight"
  attr_accessor :airport_id
end
