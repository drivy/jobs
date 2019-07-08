# Level 2

## Summary

The `level2` program will send log messages to a local HTTP server at http://localhost:3000/.
The requests are HTTP POST requests with a plain-text payload similar to level1's logs input files

## Instructions

Write a simple HTTP server that serves the requests, parses the logs, and writes the result to a JSON file `./parsed/#{id}.json`, with the same format as level1.

## Hints

To serve HTTP requests you could use [Sinatra](https://github.com/sinatra/sinatra) or [Hanami](https://github.com/hanami/hanami).

