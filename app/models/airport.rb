class Airport < ActiveRecord::Base
  validates_presence_of :code
end
