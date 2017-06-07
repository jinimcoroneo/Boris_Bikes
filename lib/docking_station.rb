require "./lib/bike.rb"

class DockingStation

  attr_reader :bikes

  def initialize
  	@bikes = []
  end
  
  def release_bike
  	raise "There are no available bikes" unless @bikes.size >= 1
  	@bikes.pop
  end

  def dock_bike(bike)
  	raise "Station full, cannot dock bike" if @bikes.size >= 20
  	@bikes << bike
  end

end