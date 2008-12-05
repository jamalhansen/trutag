require 'rubygems'
gem 'libxml-ruby'
require 'xml'
require 'time'
require 'tagged_item'

module TRuTag
    class AtomParser
      include XML::SaxParser::Callbacks
      
      def on_characters (chars) 
        if chars.strip == ""
          return
        end
        
        #puts "  Charaters #{chars}"
        case @element
        when "id":
          @item.guid = chars if !@item.nil?
        when "published":
          @item.published_date = Time.parse(chars)
        when "title":
          @item.title = chars if !@item.nil?
        end
      end
      
      def on_start_element(element, attributes)
        @element = element
        #puts "Element #{element} Attributes #{attributes}"
        case @element
        when "entry":
          @item = TRuTag::TaggedItem.new
        when "link":
          if !@item.nil? && (attributes["rel"] == "alternate")
            @item.reference_url = attributes["href"]
            @item.source_url = attributes["href"]
          end
        when "category":
          #if the tag doesn't already exist in the hash, create it.
          @tags[attributes["term"]] = [] if !@tags.has_key? attributes["term"]
          #if the item doesn't already exist for the tag, add it.
          @tags[attributes["term"]] << @item if !@tags[attributes["term"]].include? @item
        end
      end
      
      def on_end_element(element)
        case element
        when "entry":
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