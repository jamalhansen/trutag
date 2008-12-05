module TRuTag
  class MagnoliaAtomService
    def initialize(http_service)
      @http_service = http_service
    end

    def get(params)
      url = build_url(params)
      @http_service.get(url)
    end
    
    def build_url params
      if params.has_key? :tag
        "ma.gnolia.com/atom/full/tags/#{params[:tag]}"
      else
        "ma.gnolia.com/atom/full/people/#{params[:user]}"
      end
    end
  end
end