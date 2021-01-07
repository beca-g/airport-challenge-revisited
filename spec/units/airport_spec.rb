require "Airport"

describe Airport do
  subject(:airport) { described_class.new(weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe "#land" do
    context "when weather is not stormy" do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end
      it "instructs planes to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end
  
      context "when the runway is full" do
        it "will raise an error if the runway is full" do
          airport.capacity.times { airport.land(plane) } 
          expect { airport.land(plane) }.to raise_error "Unable to land: airport full."
        end
      end
    end

    context "when weather is stormy" do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end
      it "will raise an error if the weather is stormy" do
        expect { airport.land(plane) }.to raise_error "Unable to land: weather is stormy."
      end
    end
  end

  describe "#take_off" do
    context "when weather is not stormy" do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end
      it "instructs planes to take_off" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end 

      it "returns the plane that took off" do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane 
      end

      it "raises an error if the plane is not in this airport" do
        new_airport = described_class.new(10, weather)
        new_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error "Unable to take off: plane is not in this airport."
      end
    end

    context "when weather is stormy" do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end
      it "does not allow planes to take off" do
        expect { airport.take_off(plane) }.to raise_error "Unable to take off: weather is stormy."
      end
    end
  end
end
