require "json"

class SlowComputation
  def initialize(json)
    @json = JSON.parse(json)
  end

  def compute
    sleep 10
    @json["slow_computation"] = "0.0009878"
    @json.to_json
  end
end
