describe "user stories" do
  describe "user story one" do
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
    it "so planes can land at airports, instruct a plane to land" do
      airport = Airport.new
      plane = Plane.new
      expect { airport.land(plane) }.not_to raise_error
    end
  end
end