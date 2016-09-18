require "json"
require "./level1/main"

RSpec.describe Level1::Main do
  let(:data) do
    {
      "cars" => [
        { "id" => 1, "price_per_day" => 2000, "price_per_km" => 10 },
        { "id" => 2, "price_per_day" => 3000, "price_per_km" => 15 },
        { "id" => 3, "price_per_day" => 1700, "price_per_km" => 8 }
      ],
      "rentals" => [
        {
          "id" => 1,
          "car_id" => 1,
          "start_date" => "2017-12-8",
          "end_date" => "2017-12-10",
          "distance" => 100
        },
        {
          "id" => 2,
          "car_id" => 1,
          "start_date" => "2017-12-14",
          "end_date" => "2017-12-18",
          "distance" => 550
        },
        {
          "id" => 3,
          "car_id" => 2,
          "start_date" => "2017-12-8",
          "end_date" => "2017-12-10",
          "distance" => 150
        }
      ]
    }.to_json
  end

  let(:output) do
    {
      "rentals" => [
        { "id" => 1, "price" => 7000 },
        { "id" => 2, "price" => 15_500 },
        { "id" => 3, "price" => 11_250 }
      ]
    }.to_json
  end

  subject { described_class.perform(data) }

  describe ".perform" do
    it "returns the correct values" do
      expect(subject).to eq output
    end
  end
end
