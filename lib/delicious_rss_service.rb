
module TRuTag
  class DeliciousRssService
    def initialize(http_service)
      @http_service = http_service
    end

    def get(params)
      url = build_url(params)
      @http_service.get(url)
    end
    
    def build_url params
      url = "feeds.delicious.com/v2/rss"
      
      if !params.nil?
        url += "/#{params[:user]}" if params.has_key? :user
        url += "/#{params[:tag]}" if params.has_key? :tag
        url += "?count=#{params[:count]}" if params.has_key? :count
      end
      
      url
    end
  end
end