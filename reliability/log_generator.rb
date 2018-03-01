class LogGenerator
  SERVICES = %w{
    web
    admin
    api
  }.freeze

  def self.sample(uuid)
    service = SERVICES.sample

    [
      "id=#{uuid}",
      "service_name=#{service}",
      "process=#{service}.#{rand(1..4000)}",
      "sample#load_avg_1m=#{rand.round(3)}",
      "sample#load_avg_5m=#{rand.round(3)}",
      "sample#load_avg_15m=#{rand.round(3)}",
    ].join(" ")
  end
end
