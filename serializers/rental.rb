require "active_model"
require "json"

module Serializers
  class Rental
    include ActiveModel::Model

    attr_accessor :car, :rental
    delegate :id, :start_date, :end_date, :distance, to: :rental
    delegate :price_per_day, :price_per_km, to: :car

    delegate :parse, to: Date

    def as_json
      { id: id, price: price }
    end

    def price
      time_price + distance_price
    end

    def time_price
      # assuming that end_date is counted in the price
      (parse(end_date) - parse(start_date)).to_i * price_per_day + price_per_day
    end

    def distance_price
      distance * price_per_km
    end
  end
end
