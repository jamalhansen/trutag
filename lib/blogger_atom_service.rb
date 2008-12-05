module TRuTag
  class BloggerAtomService
    def initialize(http_service)
      @http_service = http_service
    end

    def get(params)
      url = build_url(params)
      @http_service.get(url)
    end
    
    def build_url params
      "#{params[:user]}.blogspot.com/feeds/posts/default"
    end
  end
end