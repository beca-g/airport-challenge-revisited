class Airport
  attr_reader :capacity, :runway
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
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
