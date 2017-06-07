require "./lib/bike.rb"

class DockingStation

  attr_reader :bike
  
  def release_bike
  	raise "There are no available bikes" unless @bike
  	@bike
  end

  def dock_bike(bike)
  	raise "Station full, cannot dock bike" if @bike
  	@bike = bike
  end

end