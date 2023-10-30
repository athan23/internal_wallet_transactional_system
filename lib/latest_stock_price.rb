require 'uri'
require 'net/http'
require 'json'

class LatestStockPrice
  API_HOST = "latest-stock-price.p.rapidapi.com"
  API_BASE_URL = "https://#{API_HOST}"

  def initialize(api_key)
    @api_key = api_key
  end

  def price(indices)
    uri = URI("#{API_BASE_URL}/price?Indices=#{indices}")
    response = send_request(uri)
    JSON.parse(response.body)
  end

  # Not sure about this one. The example given for /prices is the same as /price
  def prices
    uri = URI("#{API_BASE_URL}/prices")
    response = send_request(uri)
    JSON.parse(response.body)
  end

  def price_all
    uri = URI("#{API_BASE_URL}/any")
    response = send_request(uri)
    JSON.parse(response.body)
  end

  private

  def send_request(uri)
    request = Net::HTTP::Get.new(uri)
    request["X-RapidAPI-Host"] = API_HOST
    request["X-RapidAPI-Key"] = @api_key

    http = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = true

    http.request(request)
  end
end
