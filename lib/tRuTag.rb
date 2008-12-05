$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'http_service'
require 'atom_parser'
require 'tagged_item'
require 'blogger_atom_service'
require 'delicious_rss_service'
require 'magnolia_atom_service'
require 'delicious_rss_parser'

module TRuTag
  VERSION = '0.0.1'
end

include TRuTag