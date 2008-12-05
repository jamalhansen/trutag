
module TRuTag
  class MockHttpService
    attr_reader :read_timeout, :open_timeout, :http_code, :source_file, :requested_url
    
    def initialize(params = {})
      defaults = { :read_timeout => 5, :open_timeout => 5, :source_file => nil }
      
      params.each {|key, value|
          defaults[key] = value if defaults.key? key
        }
      
      @read_timeout = defaults[:read_timeout]
      @open_timeout = defaults[:open_timeout]
      @source_file = defaults[:source_file]
      @http_code = nil
    end
    
    def get(request)
      @requested_url = request
      @http_code = "200"
      file = File.new(File.dirname(__FILE__) + "/#{@source_file}")
      file.read
    end
  end
end