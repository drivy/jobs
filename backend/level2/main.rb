require 'json'
require 'rubygems'
require 'active_model'
require 'active_support/all'

# your code
p INPUT = File.open('data.json').read

class Processor
  attr_reader :input, :cars, :rentals

  def initialize(input)
    @input = JSON.parse(input)
    @cars = @input['cars'].map { |car| Car.new(car) }
    @rentals = @input['rentals'].map do |rental|
      Rental.new(rental.merge(car: @cars.find { |e| e.id == rental['car_id']}))
    end
  end

  def process
    rentals.map(&:compute_price)
    self
  end

  def to_json
    JSON.pretty_generate({ rentals: rentals.map(&:as_json) })
  end
end

class Car
  include ActiveModel::Model
  attr_accessor :id, :price_per_day, :price_per_km
end

class Rental
  include ActiveModel::Model
  attr_accessor :id, :car_id, :car, :start_date, :end_date, :distance, :price

  def compute_price
    days = (Date.parse(end_date) - Date.parse(start_date)).to_i + 1
    day_price = 0
    (1..days).to_a.each_with_index do |index, _|
      day_price += case
                when index > 10 then car.price_per_day * 0.5
                when index > 4 then car.price_per_day * 0.7
                when index > 1 then car.price_per_day * 0.9
                else
                  car.price_per_day
                end
    end
    p day_price
    self.price =  (day_price +
                   distance * car.price_per_km).to_i
  end

  def as_json(*params)
    {id: id, price: price}
  end
end

res = Processor.new(INPUT).process.to_json

File.open('my_output.json', 'w') { |file| file.write(res) }
