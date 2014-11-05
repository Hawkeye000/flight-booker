class FlightsController < ApplicationController

  def index
    @flights = Flight.search(params.symbolize_keys)
  end

end
