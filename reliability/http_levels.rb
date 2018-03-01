require "securerandom"
require "net/http"
require "json"
require_relative("log_generator")

http = Net::HTTP.new("127.0.0.1", 3000)
http.read_timeout = 0.1

1000.times do
  uuid = SecureRandom.uuid

  begin
    http.request_post("/", JSON.generate({
      log: LogGenerator.sample(uuid)
    })) {}
  rescue Net::ReadTimeout
    puts "Remote server timed-out on http://127.0.0.1:3000"
  rescue Errno::ECONNREFUSED
    puts "Connection refused on http://127.0.0.1:3000"
  end
end
