class Airport
  attr_reader :capacity, :runway

  def initialize(capacity = 20)
    @capacity = capacity
    @runway = []
  end

  def land(plane)
    raise "Unable to land: airport full." if @runway.length == @capacity
    @runway << plane
  end

  def take_off(plane)
  end
end
