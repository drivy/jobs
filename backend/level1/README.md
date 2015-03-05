# Intro

We are building a peer-to-peer car rental service. Let's call it Drivy :)

Here is our plan:
- let any car owner list her car on our platform
- let any person (let's call her 'driver') book a car for given dates/distance


# Level 1

The car owner chooses a price per day and price per km for her car.
The driver then books the car for a given period and an approximate distance.

The rental price is the sum of:
- a time component: the number of rental days multiplied by the car's price per day
- a distance component: the number of km multiplied by the car's price per km

Write code that generates `output.json` from `data.json`