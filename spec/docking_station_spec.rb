require "./lib/docking_station.rb"

describe DockingStation do 

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

    it "raises an error when the station is at capacity (20 bikes)" do
      20.times { subject.dock_bike(Bike.new) }
      expect{ subject.dock_bike(Bike.new) }.to raise_error "Station full, cannot dock bike"
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
  end
end