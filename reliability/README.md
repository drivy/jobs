# Drivy Reliability Challenge

Looking for a job? Check out our [https://en.drivy.com/jobs](https://en.drivy.com/jobs).

## Guidelines
- Clone this repo (do not fork it)
- Commit your code
- Once you are done, ping someone from Drivy (ideally via our jobs page)

Please do the simplest thing that could work for the level you're currently solving.

For higher levels we are interested in seeing code that is:

- Clean
- Extensible
- Reliable

## Challenge

The challenge needs to be resolved in Ruby.

Each level is a directory containing ruby executables and libraries that you'll have to use.

You can't modify them.

Your solution to each level needs to live in the level directory.

## Level 1

Go into the `level1` directory and launch the `level1` program.
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

Go into the `level2` directory.
When you launch the `level2` program it will send the same log messages to a local HTTP server at http://localhost:3000/.
The HTTP server listens to POST requests on the port 3000.

**The POST requests will timeout after 100ms.**

You need to write a simple HTTP server that will listen to this requests, parse the logs and write the result to a JSON file in `./parsed/#{id}.json` in the same format than level1.
To write a simple HTTP server look at [Sinatra](https://github.com/sinatra/sinatra) or [Hanami](https://github.com/hanami/hanami).

## Level 3

Go into the level3 directory.
The level3 program is the same as level2.

This time your HTTP server need to parse the logs and send them to a Redis `LIST` on a local Redis instance (redis://localhost:6379).

## Level 4

Go into the level4 directory.
The level4 program is the same as level2 and level3.

Your HTTP server, after parsing the logs, needs to enrich them with a library called `SlowComputation`.

To use this library:

```
require "slow_computation"

new_json = SlowComputation.new(your_json).compute
puts new_json
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

-------

We hope you'll have fun doing this challenge. It shouldn't take more than a few hours. Enjoy and be reliable <3


