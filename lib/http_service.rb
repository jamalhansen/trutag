require 'net/http'
require 'uri'

module TRuTag
  class HttpService
    attr_reader :read_timeout, :open_timeout, :http_code, :requested_url
    
    def initialize(params = {})
      defaults = { :read_timeout => 5, :open_timeout => 5 }
      
      params.each {|key, value|
          defaults[key] = value if defaults.key? key
        }
      
      @read_timeout = defaults[:read_timeout]
      @open_timeout = defaults[:open_timeout]
      @http_code = nil
    end
    
    def get(request)
      @requested_url = request
      #http://www.opensourceconnections.com/2008/04/24/adding-timeout-to-nethttp.get_response/
      url = URI.parse("http://#{request}")
      http = Net::HTTP.new(url.host, url.port)
      http.read_timeout = @read_timeout
      http.open_timeout = @open_timeout
      resp = http.start() {|http|
        http.get(url.path)
      }
      #puts(resp.kind_of?(Net::HTTPResponse))
      @http_code = resp.code
      resp.body
    end
  end
end