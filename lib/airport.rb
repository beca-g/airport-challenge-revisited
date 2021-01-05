class Airport
  attr_reader :capacity, :runway
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @runway = []
  end

  def land(plane)
    raise "Unable to land: airport full." if full?

    @runway << plane
  end

  def take_off(plane)
  end

  private 
  
  def full?
    @runway.length >= @capacity
  end
end
