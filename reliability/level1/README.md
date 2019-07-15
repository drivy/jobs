# Level 1

## Summary

The `level1` program will write log messages into `./logs/#{id}.txt` files.
Each file will contain one messsage log similar to this one:
```
id=0060cd38-9dd5-4eff-a72f-9705f3dd25d9 service_name=api process=api.233 sample#load_avg_1m=0.849 sample#load_avg_5m=0.561 sample#load_avg_15m=0.202
```

## Instructions

You need to write a program that will parse the messages, writes the result to a JSON file in `./parsed/#{id}.json` and deletes the original message.

The outputed JSON file should be in the format:
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