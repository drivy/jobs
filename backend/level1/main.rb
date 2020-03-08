require 'json'
require 'date'

# Get data from json file
def get_input_data(file)
  file = File.read(file)

  JSON.parse(file)
end

# Calculate number of renting days
def rental_days(end_date, start_date)
  # mjd returns value of date in number
  days_between = Date.parse(end_date).mjd - Date.parse(start_date).mjd

  days_between + 1
end

# Calculate price value among time
def time_price(rental, price_per_day)
  rental_days(rental['end_date'], rental['start_date']) * price_per_day
end

# Calculate price value among distance
def distance_price(rental, price_per_km)
  rental['distance'] * price_per_km
end

# Calculate rentals prices
def rentals_prices
  data = get_input_data('./data/input.json')
  cars = data['cars']
  rentals = data['rentals']

  output_rentals = []
  rentals.each do |rental|
    car = cars.find { |c| c['id'] == rental['car_id'] }
    price_per_day = car['price_per_day']
    price_per_km = car['price_per_km']

    price = time_price(rental, price_per_day).to_i + distance_price(rental, price_per_km).to_i

    output_rentals << { id: rental['id'], price: price }
  end

  { 'rentals': output_rentals }
end

# Generate json output for rental prices
def generate_rentals_output
  file = File.open('./data/output.json', 'w')

  file.write(JSON.pretty_generate(rentals_prices))
end

generate_rentals_output
