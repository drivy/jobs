require "./models/rental"

RSpec.describe Models::Rental do
  let(:attributes) do
    {
      "id": 1,
      "car_id": 1,
      "start_date": "2017-12-8",
      "end_date": "2017-12-10",
      "distance": 100
    }
  end

  subject {described_class.new(attributes) }

  describe ".new" do
    it "instantiates correctly from attributes hash" do
      expect(subject.id).to eq 1
      expect(subject.car_id).to eq 1
      expect(subject.start_date).to eq "2017-12-8"
      expect(subject.end_date).to eq "2017-12-10"
      expect(subject.distance).to eq 100
    end
  end
end
