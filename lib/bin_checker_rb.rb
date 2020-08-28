require 'bin_checker_rb/version'
require 'faraday'
require 'json'

module BinCheckerRb
  class Error < StandardError; end
  
  def self.parse(body)
    begin
      response = JSON.parse(body, symbolize_names: true)
    rescue JSON::ParserError
      return {error: "JSON decoding error"}
    end
    response
  end
  
  def self.check(bin_number, timeout=5)
    promptapi_endpoint = ENV['PROMPTAPI_TEST_ENDPOINT'] || "https://api.promptapi.com/bincheck/#{bin_number}"
    apikey = ENV['PROMPTAPI_TOKEN'] || nil
    return {error: "You need to set PROMPTAPI_TOKEN environment variable"} unless apikey
    
    conn = Faraday.new(url: promptapi_endpoint, request: {timeout: timeout}) do |c|
      c.use Faraday::Response::RaiseError
    end

    begin
      resp = conn.send(:get) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['apikey'] = apikey
      end
    rescue Faraday::ConnectionFailed
      return {error: "Connection error"}
    rescue Faraday::TimeoutError => e
      return {error: e.message.capitalize}
    rescue Faraday::ClientError => e
      return ::BinCheckerRb.parse(e.response[:body])
    rescue Faraday::ServerError => e
      return {error: e.message.capitalize}
    end
    ::BinCheckerRb.parse(resp.body)
  end
end
