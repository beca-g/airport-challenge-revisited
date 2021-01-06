class Airport
  attr_reader :capacity, :runway
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @runway = []
  end

  def land(plane)
    raise "Unable to land: airport full." if full?
    raise "Unable to land: weather is stormy." if stormy?
    @runway << plane
  end

  def take_off(plane)
    raise "Unable to take off: weather is stormy." if stormy?
  end

  private 

  def full?
    @runway.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end
end
