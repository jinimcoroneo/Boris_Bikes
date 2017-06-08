require "./lib/docking_station.rb"

class Bike

  attr_reader :condition

  def initialize(condition = "working")
  	@condition = condition
  end

  def working?
  	self.condition == "working" ? true : false
  end

  def broken?
  	self.condition == "broken" ? true : false
  end

  def report_broken
  	@condition = "broken"
  end

end



