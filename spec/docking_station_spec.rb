require "./lib/docking_station.rb"

describe DockingStation do 

  it "releases working bikes" do
  	bike = Bike.new
  	subject.dock_bike(bike)
  	bike = subject.release_bike
  	expect(bike).to be_working
  end

  describe "#dock_bike" do
    it "docks a bike" do
    	bike = Bike.new
    	expect(subject.dock_bike(bike)).to eq bike
    end

    it "raises an error when there is already a docked bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect{ subject.dock_bike(bike) }.to raise_error "Station full, cannot dock bike"
    end  
  end

  describe "#release_bike" do
  	it "does not release a bike if there are none available" do
  	  expect { subject.release_bike }.to raise_error("There are no available bikes")
  	end
  end
end