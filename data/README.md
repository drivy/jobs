# Drivy Data Challenge

Looking for a job? Check out our [open positions](https://en.drivy.com/jobs).

## Guidelines

- clone this repo (do **not** fork it)
- solve the levels in ascending order
- commit your code at the end of each level
- once you are done, ping someone from Drivy (ideally via our jobs page)

Please do the **simplest thing** that could work for the level you're currently solving.

Disclaimer: the levels become more complex over time, so you will probably have to re-use some code and adapt it to the new requirements. Keep it simple, you can refactor your code in the next levels.

For higher levels we are interested in seeing code that is:
- clean
- extensible
- robust (don't overlook edge cases, use exceptions where needed, ...)

---
## Data
We provide some (fake) data to play with, that you will use in both challenges. You will work with cars, rentals and unavailabilities. You can download the CSV files here:

- cars: https://cl.ly/eDaw
- rentals: https://cl.ly/eDUn
- unavailabilities: https://cl.ly/eDd7

### Data description
**Cars**:
- `id`: the car ID
- `city`: the city where the car is available
- `created_at`: date when the car was made available on the platform

**Rentals**:
- `id`: the rental ID
- `car_id`: the ID of the car used for this rental
- `starts_at`: the datetime when the rental starts
- `ends_at`: the datetime when the rental ends

**Unavailabilities** (tells when a car is marked as unavailable by the owner):
- `id`: the unavailability ID
- `car_id`: the ID of the car that is concerned
- `starts_at`: the datetime when the unavailability starts
- `ends_at`: the datetime when the unavailability ends

**Remarks regarding data quality:**
rentals and unavailabilities `starts_at` and `ends_at` columns only contain `00:00:00` or `12:00:00` time components providing a half-day (AM/PM) level of detail.
rentals and unavailabilities are clean: there is no overlap between rentals, between unavailabilities or between rentals and unavailabilities. car_id and dates are also clean: no `NULL` value or erroneous value.
cars: all fields are clean except `created_at`, which can be `NULL`

----
## SQL challenge
Thanks to the provided CSV files, you will need to answer the following questions with SQL queries. We recommend that you use PostgreSQL as you may want to use window functions.

1. Explain how you create tables and load data into these tables
1. According to you, in which timezone rentals and unavailabilities datetimes are stored in?
1. Verify that you don't have any overlap between unavailabilities and rentals for each car
1. Find the top 10 cities with the highest number of cars. Only display 10 rows
1. For each rental, create a new column `duration` and compute it as explained. The `duration` is based on the number of half-days for a rental. A rental starting at 2017-06-01 00:00:00 and ending on 2017-06-02 12:00:00 spawns 3 half-days: [2017-06-01 AM, 2016-06-01 PM, 2017-06-02 AM]. The first 3 half-days count for a duration of 1, and then we need 2 more half-days to increase the duration (a duration of 2 can be made of 4 or 5 half-days).
1. Find the total number of rental days (using the `duration` column) for each city, for each month. You can attribute a rental to a month thanks to its `starts_at` column. Can you explain which bias we have with this? What would be a better way to count the number of rental days?
1. We now want to fix the `NULL` `created_at` for cars. For each car with a `NULL` `created_at`, we will consider that they were created on the same date as the previous car (ie. the car with the closest `id` before with a non null `created_at`). Assume that cars can be more than 1 ID apart.
1. For each month, find how many cars reach their 3rd rental. Use the `starts_at` to determine the month to attribute.

----
## Coding challenge
**General instructions**: For the different levels, you should use the provided CSV files and a dynamic language such as Python or Ruby. You should read the CSV files, do some processing as asked and then output back your results to a CSV file with the appropriate columns.

**Goal:**
 Provide the business intelligence team a report of the occupancy rate of the fleet per city.

The occupancy rate of a given half-day is defined as the number of rented cars / number of available or rented cars.

For a half-day T, a car is considered `available` by default. This default state can be changed to:
- `rented`: the car is booked over T
- `unavailable`: the owner has declared not wanting to rent over T. The car hence gets hidden from search results and cannot receive rental requests

Each unavailability is a period defined by a start datetime and an end datetime. The level of detail is a half-day (AM/PM).

Rentals also are periods defined by a start datetime and end datetime with a level of detail of a half-day.

Cars have a `created_at` date: they do not exist on the website before this date.

**Example of calendar:**

![Calendar](https://drivy-misc.s3.amazonaws.com/jobs/calendar.jpg "Calendar")

### Level 1
Compute the state of each car for each half-day in 2015. A car state can be `available`, `rented` or `unavailable`.
As a simplification you can consider that the cars with a `NULL` `created_at` field were created in 2014.

### Level 2
Write a program that fixes the `NULL` `created_at` values and outputs a fixed version of the cars CSV.
For each car with a `NULL` `created_at`, we will consider that they were created on the same date as the previous car (ie. the car with the previous `id`).
Don't forget to recompute the state of each car for each half-day in 2015.

### Level 3
Compute the occupancy rate per week per city.

### Level 4
We now have the data needed by the business intelligence team and would like to automate a weekly reporting. Describe in a few lines how you would automate calculations and automatically send an extract every week.
