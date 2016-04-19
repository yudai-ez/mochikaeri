require "net/http"

class Client
  URL = "#{ENV["BASE_URI"]}/issues.json"

  def initialize(payload)
    @payload = payload
  end

  def run
    uri = URI.parse(URL)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    req = Net::HTTP::Post.new(uri.request_uri)
    req["X-Redmine-API-key"] = ENV["API_KEY"]
    req["Content-Type"] = "application/json"
    req.body = @payload.to_json
    res = https.request(req)

    case res
    when Net::HTTPSuccess
      result = JSON.parse(res.body)
      system("open #{ENV["BASE_URI"]}/issues/#{result["issue"]["id"]}")
    else
      puts res.error!
    end
  end
end

