class News::Client
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
    @result = JSON.parse(http.request(request).body)
    puts @result.inspect
  end
end
