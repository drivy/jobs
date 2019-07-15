# Level 4

## Summary

The level4 program is the same as level2 and level3.

## Instructions

Write a simple HTTP server that serves the requests, parse and "enrich" the logs, and store them into a Redis `LIST` on a local Redis instance.

The log "enrichment" is done using the provided `SlowComputation` module.

**BEWARE** This module is pretty slow and the level4 program enforces a 100ms timeout.

Please include a short explanation (<200 words) that highlights some of the advantages and shortcommings of your approach.


## How to use `SlowComputation`

```rb
require "slow_computation"

new_json = SlowComputation.new(your_json).compute
```

eg:
```json
{
  "id": "2acc4f33-1f80-43d0-a4a6-b2d8c1dbbe47",
  "service_name": "web",
  "process": "web.1089",
  "load_avg_1m": "0.04",
  "load_avg_5m": "0.10",
  "load_avg_15m": "0.31",
  "slow_computation": "0.0009878"
 }
```

