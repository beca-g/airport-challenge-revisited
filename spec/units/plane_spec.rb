require "Plane"

describe Plane do
  subject(:plane) { described_class.new }

  describe "#take_off" do
    it { is_expected.to respond_to :take_off }

    it "raises an error if the plane is already flying" do
      expect { plane.take_off }.to raise_error "Plane unable to take off: plane already flying."
    end
  end

  describe "#airport" do
    it { is_expected.to respond_to :airport }

    it "raises an error if the plane is already flying" do
      expect { plane.airport }.to raise_error "Plane not at airport: plane already flying."
    end
  end
end
