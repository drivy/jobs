require "./serializers/rental"

RSpec.describe Serializers::Rental do
  let(:rental) do
    double(
      :rental,
      id: 1,
      start_date: "2017-12-8",
      end_date: "2017-12-10",
      distance: 100
    )
  end
  let(:car) { double(:car, id: 1, price_per_day: 2000, price_per_km: 10) }

  subject { described_class.new(rental: rental, car: car) }

  describe "#as_json" do
    let(:expected) { { id: 1, price: 7000 } }

    it "serializes successfully by the given entities" do
      expect(subject.as_json).to eq expected
    end
  end

  describe "#price" do
    let(:price) { 7000 }

    it "returns the price successfully" do
      expect(subject.price).to eq 7000
    end
  end
end
