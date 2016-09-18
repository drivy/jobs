require "active_model"

module Models
  class Car
    include ::ActiveModel::Model

    attr_accessor :id, :price_per_day, :price_per_km
  end
end
