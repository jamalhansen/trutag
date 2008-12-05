begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'spec'
  require 'spec'
end

require File.dirname(__FILE__) + '/mock_http_service'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'tRuTag'

