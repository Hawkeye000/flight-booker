class Airport < ActiveRecord::Base
  validates_presence_of :code
  attr_accessor :airport_id
end
