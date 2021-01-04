require "Airport"

describe Airport do
  subject(:airport) { described_class.new }
  describe "#land" do
    it "instructs planes to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end
  end
end