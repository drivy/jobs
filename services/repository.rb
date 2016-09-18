require "active_support/core_ext/module/delegation"
require "./models/rental"
require "./models/car"

module Services
  class Repository
    attr_reader :data

    delegate :[], to: :data

    def initialize(data)
      @data = JSON.parse(data).deep_symbolize_keys
    end

    def rentals_with_car
      @_rentals ||= begin
        data[:rentals].map do |rental_params|
        rental = ::Models::Rental.new(rental_params)
        car = car_by_rental(rental)

        { rental: rental, car: car }
        end
      end
    end

    def car_by_rental(rental)
      car_params = car_params_by_rental(rental)
      ::Models::Car.new(car_params) if car_params.present?
    end

    private

    def car_params_by_rental(rental)
      data[:cars].bsearch { |car_params| car_params[:id] >= rental.car_id }
    end
  end
end
