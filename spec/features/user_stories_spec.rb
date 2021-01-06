describe "user stories" do

  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport
  it "so planes can land at airports, instruct a plane to land" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
  end

  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it "so planes can take off from airports, instruct a plane to take off" do
    airport = Airport.new
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when the airport is full 
  it "prevents planes landing when the airport is at capacity" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    20.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Unable to land: airport full."
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  it "airports have a default capacity" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Unable to land: airport full."
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent takeoff when weather is stormy 
  it "does not allow planes to land when stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error "Unable to land: weather is stormy."
  end
end
