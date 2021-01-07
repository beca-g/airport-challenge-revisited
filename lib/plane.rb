class Plane

  def take_off
    raise "Plane unable to take off: plane already flying."
  end

  def airport
    raise "Plane not at airport: plane already flying."
  end
end
