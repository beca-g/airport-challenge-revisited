require "Airport"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  
  describe "#land" do
    it "instructs planes to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "will raise an error if the runway is full" do
      airport.capacity.times { airport.land(plane) } 
      expect { airport.land(plane) }.to raise_error "Unable to land: airport full."
    end
  end

  describe "#take_off" do
    it "instructs planes to take_off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end
