require_relative "Weather"

class Airport
  attr_reader :capacity, :runway, :weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @runway = []
  end

  def land(plane)
    raise "Unable to land: airport full." if full?
    raise "Unable to land: weather is stormy." if stormy?
    
    plane.land(self)
    add_plane(plane)
  end

  def take_off(plane)
    raise "Unable to take off: weather is stormy." if stormy?
    raise "Unable to take off: plane is not in this airport." unless in_airport?(plane)

    plane.take_off
    remove_plane(plane)
    plane
  end

  private 

  def full?
    runway.length >= capacity
  end

  def stormy?
    weather.stormy? 
  end

  def in_airport?(plane)
    runway.include?(plane)
  end

  def add_plane(plane)
    runway << plane
  end

  def remove_plane(plane)
    runway.delete(plane)
  end
end
