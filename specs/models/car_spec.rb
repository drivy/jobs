require "./models/car"

RSpec.describe Models::Car do
  let(:attributes) do
    { "id" => 1, "price_per_day" => 2000, "price_per_km" => 10 }
  end
  subject { described_class.new(attributes) }

  describe ".new" do
    it "instantiates correctly by the given attributes" do
      expect(subject.id).to eq 1
      expect(subject.price_per_day).to eq 2000
      expect(subject.price_per_km).to eq 10
    end
  end
end
