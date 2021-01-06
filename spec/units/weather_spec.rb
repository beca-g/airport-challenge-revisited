require "Weather"

describe Weather do
  subject(:weather) { described_class.new }

  describe "#stormy?" do
    it "when stormy" do
      allow(Kernel).to receive(:rand).and_return 6
      expect(weather.stormy?).to be true
    end

    it "when not stormy" do
      allow(Kernel).to receive(:rand).and_return 2
      expect(weather.stormy?).to be false
    end
  end
end