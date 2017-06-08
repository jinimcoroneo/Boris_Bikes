require "./lib/bike.rb"

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
  	@bikes = []
    @capacity = capacity
  end
  
  def release_bike
  	raise "There are no available bikes" if empty?
    raise "The bike is broken!" if @bikes.first.broken?
  	@bikes.shift
  end

  def dock_bike(bike)
  	raise "Station full, cannot dock bike" if full?
  	@bikes << bike
  end

private

  def full?
    @bikes.count >= DEFAULT_CAPACITY ? true : false
  end

  def empty?
    @bikes.size < 1 ? true : false
  end
end