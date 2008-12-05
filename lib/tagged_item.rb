module TRuTag
  class TaggedItem
    attr_accessor :source_url, :guid, :guid_permalink, :published_date, :reference_url, :title
    
    def initialize
      @guid_permalink = false
    end
    
    def == other
      if self.guid.nil?
        return super.==(other)
      else
        self.guid == other.guid
      end      
    end
  end
end