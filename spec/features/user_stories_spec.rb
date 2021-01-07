describe "user stories" do
  let(:airport) { Airport.new(weather) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context "when weather is not stomry" do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end

    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
    it "so planes can land at airports, instruct a plane to land" do
      expect { airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it "so planes can take off from airports, instruct a plane to take off" do
      airport.land(plane)
      expect { airport.take_off(plane) }.not_to raise_error
    end

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when the airport is full 
    it "prevents planes landing when the airport is at capacity" do
      20.times do
        new_plane = Plane.new
        airport.land(new_plane)
      end
      expect { airport.land(plane) }.to raise_error "Unable to land: airport full."
    end

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate
    it "airports have a default capacity" do
      Airport::DEFAULT_CAPACITY.times do
        new_plane = Plane.new
        airport.land(new_plane)
      end
      expect { airport.land(plane) }.to raise_error "Unable to land: airport full."
    end
  end

  context "when stormy" do
    before do
      allow(weather).to receive(:stormy?).and_return true
    end

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent takeoff when weather is stormy 
    it "does not allow planes to land" do
      expect { airport.land(plane) }.to raise_error "Unable to land: weather is stormy."
    end

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent takeoff when weather is stormy 
    it "does not allow planes to take off" do
      expect { airport.take_off(plane) }.to raise_error "Unable to take off: weather is stormy."
    end
  end
end
