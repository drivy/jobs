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
    rentals.map(&:build_actions)
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
  attr_accessor :id, :car_id, :car, :start_date, :end_date, :distance, :price, :commission, :deductible_reduction, :options, :actions

  def initialize(*params)
    super(*params)
    @options = { deductible_reduction: 0 }
    @actions = []
  end

  def days
    (Date.parse(end_date) - Date.parse(start_date)).to_i + 1
  end

  def compute_price
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
    self.price =  (day_price + distance * car.price_per_km).to_i
    self.commission = Commission.new(self)
    if deductible_reduction
      options[:deductible_reduction] = 400 * days
    end
  end

  def build_actions
    return unless price
    actions << Operation.new(
      who: 'driver',
      type: 'debit',
      amount: options[:deductible_reduction] + price
    )
     actions << Operation.new(
      who: 'owner',
      type: 'credit',
      amount: price - commission.as_json.values.reduce(:+)
    )
    commission.as_json.each do |k, v|
      value = v
      value += options[:deductible_reduction] if k == 'drivy_fee'
      actions << Operation.new(
        who: k.to_s.gsub(/_fee/, ''),
        type: 'credit',
        amount: value
      )
    end
  end

  def as_json(*params)
    { actions: actions.map(&:as_json) }
    # {id: id, price: price, options: options, commission: commission.as_json}
  end
end

class Commission
  include ActiveModel::Model
  attr_accessor :insurance_fee, :assistane_fee, :drivy_fee, :total

  def initialize(rental)
    @total = rental.price * 0.3
    @insurance_fee = (@total * 0.5).to_i
    @assistance_fee = rental.days * 100
    @drivy_fee = (@total - @insurance_fee - @assistance_fee).to_i
  end

  def as_json(*params)
    res = super
    res.delete('total')
    res
  end
end

class Operation
  include ActiveModel::Model
  attr_accessor :who, :type, :amount
end
res = Processor.new(INPUT).process.to_json

File.open('my_output.json', 'w') { |file| file.write(res) }
