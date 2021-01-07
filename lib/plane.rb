class Plane

  def initialize
    @flying = true
  end

  def take_off
    raise "Plane unable to take off: plane already flying." if @flying
  end

  def land(airport)
    raise "Plane unable to land: plane already landed." unless @flying

    @flying = false
    @airport = airport
  end

  def airport
    raise "Plane not at airport: plane already flying." if @flying
    @airport
  end
end
