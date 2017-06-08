require "./lib/bike.rb"

describe Bike do

  it { is_expected.to respond_to :working? }

  describe "#report_broken" do

  	it "allows you to report a broken bike" do
  		bike = Bike.new
  		bike.report_broken
  		expect(bike.condition).to eq "broken"
  	end
  end
end

