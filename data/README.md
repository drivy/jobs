# Getaround EU Data Engineering Challenge (previously Drivy)

Looking for a job? Check out our [open positions](https://uk.getaround.com.com/jobs).
You can also take a look at our [engineering blog](https://drivy.engineering/) to learn more about the way we work.


## Guidelines

- Clone this repo (do **not** fork it)
- Solve the levels in ascending order
- Only do one commit per level and include the `.git` when submiting your test

Please do the simplest thing that could work for the level you're currently solving.

For higher levels we are interested in seeing code that is:

- Clean
- Extensible
- Reliable

## Challenge

The challenge needs to be resolved in Python.
Each level depends on one python 3.7 executable and one to many libraries that you'll have to use.
**You can't modify them.**
Your solution to each level needs to live in the `level_{N}` directory.

## Level 1

Launch the `level_file` program.
It will write log messages into `./logs/#{id}.txt`.
Each file will contain one messsage log. The log looks like this:

```
id=0060cd38-9dd5-4eff-a72f-9705f3dd25d9 service_name=api process=api.233 sample#load_avg_1m=0.849 sample#load_avg_5m=0.561 sample#load_avg_15m=0.202
```

You need to write a program that will parse the messages, write the result to a JSON file in `./parsed/#{id}.json` and deletes the original message.
You need to write a JSON in the following format:

```
{
  "id": "2acc4f33-1f80-43d0-a4a6-b2d8c1dbbe47",
  "service_name": "web",
  "process": "web.1089",
  "load_avg_1m": "0.04",
  "load_avg_5m": "0.10",
  "load_avg_15m": "0.31"
}
```

## Level 2

When you launch the `levels_http` program it will send the same log messages to a local HTTP server at http://localhost:3000/.
The HTTP server listens to POST requests on the port 3000.

**The POST requests will timeout after 100ms.**

You need to write a simple HTTP server that will listen to this requests, parse the logs and write the result to a JSON file in `./parsed/#{id}.json` in the same format than Level 1.
To write a simple HTTP server look at [Flask](http://flask.pocoo.org/) or [Bottle](https://bottlepy.org/docs/dev/).

## Level 3

Launch the `levels_http` program.
This time your HTTP server need to parse the logs and send them to a Redis `LIST` on a local Redis instance (redis://localhost:6379).

## Level 4

Launch the `levels_http` program.
Your HTTP server, after parsing the logs, needs to enrich them with a library called `slow_computation`.

To use this library:

```python
import slow_computation

new_dict = slow.compute(new_dict)
print(new_dict)
# {
#   "id": "2acc4f33-1f80-43d0-a4a6-b2d8c1dbbe47",
#   "service_name": "web",
#   "process": "web.1089",
#   "load_avg_1m": "0.04",
#   "load_avg_5m": "0.10",
#   "load_avg_15m": "0.31",
#   "slow_computation": "0.0009878"
# }
```

As in level 3 you’ll send the resulting JSON in a redis LIST.
Again, the HTTP call will timeout after 100ms.

## Level SQL

### Data

We provide some (fake) data to play with. You will work with cars and rentals. You can download the CSV files here:

cars: https://cl.ly/eDaw
rentals: https://cl.ly/eDUn

### Data description

**Cars:**

- `id`: the car ID
- `city`: the city where the car is available
- `created_at`: date when the car was made available on the platform

**Rentals:**

- `id`: the rental ID
- `car_id`: the ID of the car used for this rental
- `starts_at`: the datetime when the rental starts
- `ends_at`: the datetime when the rental ends

**Remarks regarding data quality**: rentals `starts_at` and `ends_at` columns only contain `00:00:00` or `12:00:00` time components providing a half-day (AM/PM) level of detail. `rentals` are clean: there is no overlap between rentals. `car_id` and dates are also clean: no NULL value or erroneous value. cars: all fields are clean except `created_at`, which can be NULL

### Exercice

You need to solve this in SQL. You are free to choose any kind of database engine.

We first want to fix the `NULL` created_at for `cars`. For each car with a NULL created_at, we will consider that they were created on the same date as the previous car (ie. the car with the closest id before with a non null `created_at`). Assume that cars can be more than 1 ID apart.

Then, for each month, find how many cars reach their 3rd rental since their registration. Use the `starts_at` to determine the month to attribute.

-------

We hope you'll have fun doing this challenge. It shouldn't take more than a few hours. Enjoy and be reliable <3


