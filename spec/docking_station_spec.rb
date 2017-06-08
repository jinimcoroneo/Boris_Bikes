require "./lib/docking_station.rb"

describe DockingStation do 

  it "allows to specify a larger capacity when necessary" do
    station = DockingStation.new(40)
    expect(station.capacity).to eq(40)
  end

  it "sets a default capacity of 20 when no parameters are used" do
    expect(subject.capacity).to eq(20)
  end

  it "releases working bikes" do
    bike = Bike.new
    subject.dock_bike(bike)
    subject.release_bike
  	expect(bike).to be_working
  end

  describe "#dock_bike" do
    it "docks a bike" do
    	bike = Bike.new
    	subject.dock_bike(bike)
      expect(subject.bikes).to include(bike)
    end

    it "raises an error when the station is at capacity" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(Bike.new) }
      expect{ subject.dock_bike(Bike.new) }.to raise_error "Station full, cannot dock bike"
    end  

    it "docks a broken bike" do
      bike = Bike.new
      bike.report_broken
      subject.dock_bike(bike)
      expect(subject.bikes).to include(bike)
    end
  end

  describe "#release_bike" do
    it "releases a bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      subject.release_bike
      expect(subject.bikes).not_to include(bike)
    end

  	it "does not release a bike if there are none available" do
  	  expect { subject.release_bike }.to raise_error("There are no available bikes")
  	end

    it "does not release a bike if it is broken" do
      bike = Bike.new
      bike.report_broken
      subject.dock_bike(bike)
      expect { subject.release_bike }.to raise_error "The bike is broken!"
    end
  end
end