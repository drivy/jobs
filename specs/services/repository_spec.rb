require "./services/repository"
require "json"

RSpec.describe Services::Repository do
  let(:input_data) { repository_data.to_json }
  let(:rental_params_first) do
    { "id": 1,
      "car_id": 1,
      "start_date": "2017-12-8",
      "end_date": "2017-12-10",
      "distance": 100 }
  end

  let(:rental_params_last) do
    { "id": 2,
      "car_id": 1,
      "start_date": "2017-12-14",
      "end_date": "2017-12-18",
      "distance": 550 }
  end

  let(:repository_data) do
    {
      "cars": [
        { "id": 1, "price_per_day": 2000, "price_per_km": 10 },
        { "id": 2, "price_per_day": 3000, "price_per_km": 15 },
      ],
      "rentals": [rental_params_first, rental_params_last]
    }
  end

  subject { described_class.new(input_data) }

  describe ".new" do
    it "instantiates correctly from json" do
      expect(subject.data).to eq repository_data
    end
  end

  describe "#rentals_with_car" do
    # FIX ME : context case when not consistent data ( ex: rental with wrong
    # car_id ) not provided for the moment. It has be assumed that the provided
    # data that instantiates the repo is correct

    let(:rental_first_id) { 1 }
    let(:rental_last_id) { 2 }

    it "returns all the existing rentals" do
      rentals = subject.rentals_with_car
      expect(rentals.count).to eq 2

      expect(rentals.first[:rental].id).to eq 1
      expect(rentals.first[:car].id).to eq rentals.first[:rental].car_id

      expect(rentals.last[:rental].id).to eq 2
      expect(rentals.last[:car].id).to eq rentals.last[:rental].car_id
    end
  end

  describe "#car_by_rental" do
    context "when a car is present for the given rental" do
      let(:rental) { Models::Rental.new(rental_params_first) }

      it "returns the car by the given rental" do
        expect(subject.car_by_rental(rental).id).to eq 1
      end
    end

    context "when a car is not present for the given rental" do
      let(:rental) do
        Models::Rental.new(
          "id": 1,
          "car_id": 3,
          "start_date": "2017-12-8",
          "end_date": "2017-12-10",
          "distance": 100
        )
      end

      it "returns the car by the given rental" do
        expect(subject.car_by_rental(rental)).to be_nil
      end
    end
  end
end
