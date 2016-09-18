require "active_model"

module Models
  class Rental
    include ::ActiveModel::Model

    attr_accessor :id, :car_id, :start_date, :end_date, :distance
  end
end
