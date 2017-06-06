require "./lib/docking_station.rb"

describe DockingStation do 

  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
  	bike = subject.release_bike
  	expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it "docks a bike" do
  	bike = Bike.new
  	expect(subject.dock_bike(bike)).to eq bike
  end
end