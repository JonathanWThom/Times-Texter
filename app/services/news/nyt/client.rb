module News
  class Nyt::Client
    require "net/http"

    def initialize
    end

    def run
      uri = URI("https://api.nytimes.com/svc/topstories/v2/home.json")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      uri.query = URI.encode_www_form({
        "api-key" => ENV["NYT_API_KEY"]
      })
      request = Net::HTTP::Get.new(uri.request_uri)
      result = JSON.parse(http.request(request).body)
      if result["message"]
        result["message"]
      else
        News::Nyt::Parser.new(result).run
      end
    end
  end
end

## error conditions?
