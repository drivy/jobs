require "json"
require "./services/repository"

module Level1
  class Main
    def self.perform(data)
      new(data).perform
    end

    attr_reader :repo
    delegate :rentals_with_car_h, to: :repo

    def initialize(data)
      @repo = ::Services::Repository.new(data)
    end

    def perform
      rentals_as_json.to_json
    end

    private

    def rentals_as_json
      { rentals: rentals }
    end

    def rentals
      rentals_with_car_h.map do |rental_serialiazer_attrs|
        ::Serializers::Rental.new(rental_serialiazer_attrs).as_json
      end
    end
  end
end
