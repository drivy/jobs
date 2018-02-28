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

## Level 1
The `level1` binary will write log messages into `./logs/#{id}.txt`.
The goal is write a program that will parse the messages, write the result to a JSON file in `./parsed/#{id}.json` in the following format:

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

And finally delete the original raw file.

## Level 2
The `level2` binary will send the same logs to a local HTTP server.

The server needs to liste to HTTP POST on `/` on port 3000.
The HTTP call will timeout after 100ms.

To write a simple HTTP server look at [Sinatra](https://github.com/sinatra/sinatra) or [Hanami](https://github.com/hanami/hanami).

As in level 1, you need to parse the logs and write the result to a JSON file in `./parsed/#{id}.json` in the same format.

## Level 3
The `level3` binary is exactly the same as `level2`.

This time you need to parse the logs and send them to a Redis `LIST` on a local Redis instance.

Again, the HTTP call will timeout after 100ms.

## Level 4

This level is the same as the previous but you’ll have to enrich the parsed JSON using the library `slow_computation.rb` that is provided in the level4 directory.

Usage is as follows:

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

We hope you'll have fun doing this challenge. It shouldn't take more than a few hours. Have fun and be reliable <3


