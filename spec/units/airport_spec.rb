require "Airport"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe "#land" do
    it "instructs planes to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    context "when the runway is full" do
      it "will raise an error if the runway is full" do
        allow(airport).to receive(:stormy?).and_return false
        airport.capacity.times { airport.land(plane) } 
        expect { airport.land(plane) }.to raise_error "Unable to land: airport full."
      end
    end

    context "when weather is stormy" do
      it "will raise an error if the weather is stormy" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Unable to land: weather is stormy."
      end
    end
  end

  describe "#take_off" do
    it "instructs planes to take_off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end 

    context "when weather is stormy" do
      it "does not allow planes to take off" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error "Unable to take off: weather is stormy."
      end
    end
  end
end
