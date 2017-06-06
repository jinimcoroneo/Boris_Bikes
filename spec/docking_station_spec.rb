require "./lib/docking_station.rb"

describe DockingStation do 

  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
  	bike = Bike.new
  	subject.dock_bike(bike)
  	bike = subject.release_bike
  	expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it "docks a bike" do
  	bike = Bike.new
  	expect(subject.dock_bike(bike)).to eq bike
  end

  describe "#release_bike" do
  	it "does not release a bike if there are none available" do
  	  expect { subject.release_bike }.to raise_error("There are no available bikes")
  	end
  end
end