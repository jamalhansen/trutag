require File.dirname(__FILE__) + '/feature_helper'
require 'http_service'

Given /^a default http service$/ do
  @http_service = TRuTag::HttpService.new
end

Then /^the http service must have a read timeout of (\d+)$/ do |n|
  @http_service.read_timeout.should eql(n.to_i)
end

Then /^the http service should have an open timeout of (\d+)$/ do |n|
  @http_service.open_timeout.should eql(n.to_i)
end

Then /^have a nil http code$/ do
  @http_service.http_code.should eql(nil)
end

Given /^an http service created with a read timeout of (\d+) and an open timeout of (\d+)$/ do |read, open|
  @http_service = TRuTag::HttpService.new :read_timeout => read.to_i, :open_timeout => open.to_i
end

When /^get is called$/ do
  @http_doc = @http_service.get("www.google.com/")
end

Then /^a document is returned via http$/ do
  @http_doc.should_not eql(nil)
end

Then /^the http code is (\d+)$/ do |code|
  @http_service.http_code.should eql(code)
end