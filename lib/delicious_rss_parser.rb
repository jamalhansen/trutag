gem 'libxml-ruby'
require 'xml'
require 'time'
require 'tagged_item'

module TRuTag
    class DeliciousRssParser
      include XML::SaxParser::Callbacks
      
      def on_characters (chars) 
        if chars.strip == ""
          return
        end
        
        #puts "  Charaters #{chars}"
        case @element
        when "category":
          #if the tag doesn't already exist in the hash, create it.
          @tags[chars] = [] if !@tags.has_key? chars
          #if the item doesn't already exist for the tag, add it.
          @tags[chars] << @item if !@tags[chars].include? @item
        when "link":
          if @item.nil?
            # if we have a link that is before any items it is the source url
            @source_url = chars
          else
            @item.reference_url = chars
          end
        when "guid":
          @item.guid = chars
        when "pubDate":
          @item.published_date = Time.parse(chars)
        when "title":
          @item.title = chars if !@item.nil?
        end
      end
      
      def on_start_element(element, attributes)
        @element = element
        #puts "Element #{element} Attributes #{attributes}"
        case @element
        when "item":
          @item = TRuTag::TaggedItem.new
          @item.source_url = @source_url
        end
      end
      
      def on_end_element(element)
        case element
        when "item":
          @item = nil
        end
      end

      def parse xml
        @tags = {}
        parser = XML::SaxParser.new
        parser.callbacks = self
        parser.string = xml
        parser.parse
        
        @tags
      end
    end
end