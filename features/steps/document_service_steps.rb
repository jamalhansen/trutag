require File.dirname(__FILE__) + '/feature_helper'
require 'delicious_rss_service'
require 'blogger_atom_service'
require 'magnolia_atom_service'

Given /^(\w*) is used to get the document$/ do |doc_service|
  @param_hash = nil
  statement = "TRuTag::#{doc_service}.new @http_service"
  @service = eval(statement)
end

Given /^the target user is set to ([\w\-\.]*)$/ do |user|
  @param_hash ||= Hash.new
  @param_hash[:user] = user
end

Given /^the count is set to (\d*)$/ do |n|
  @param_hash ||= Hash.new
  @param_hash[:count] = n.to_i
end

Given /^the tag is set to (\w*)$/ do |tag|
  @param_hash ||= Hash.new
  @param_hash[:tag] = tag
end

Given /^the service gets the document$/ do 
  @doc = @service.get(@param_hash)
end

##########################
#Blogger
##########################
Then /^the service will request an atom feed for ([\w\-]*)$/ do |user|
  expected_url = "#{user}.blogspot.com/feeds/posts/default"
  @http_service.requested_url.should eql(expected_url)
end

##########################
#Delicious
##########################
Then /^the service will request a feed for ([\w\-]*)$/ do |user|
  expected_url = "feeds.delicious.com/v2/rss/#{user}"
  @http_service.requested_url[0..((expected_url.length) -1)].should eql(expected_url)
end

Then /^the service will request a feed for all users$/ do
  expected_url = "feeds.delicious.com/v2/rss"
  @http_service.requested_url[0..((expected_url.length) -1)].should eql(expected_url)
end

Then /^the request will be for (\d*) items$/ do |n|
  expected_url = "?count=#{n}"
  requested_url = @http_service.requested_url
  @http_service.requested_url[(requested_url.length - expected_url.length)..requested_url.length].should eql(expected_url)
end

Then /^the request will be for the tag (\w*)$/ do |tag|
  if @param_hash.has_key? :user
    expected_url = "feeds.delicious.com/v2/rss/#{@param_hash[:user]}/#{tag}"
  else
    expected_url = "feeds.delicious.com/v2/rss/#{tag}"
  end

  requested_url = @http_service.requested_url
  requested_url[0..((expected_url.length) -1)].should eql(expected_url)
end

##########################
#Magnolia
##########################
Then /^MagnoliaAtomService requests an atom feed for the tag (\w*)$/ do |tag|
  expected_url = "ma.gnolia.com/atom/full/tags/#{tag}"
  @http_service.requested_url.should eql(expected_url)
end

Then /^MagnoliaAtomService requests an atom feed for the user (\w*)$/ do |user|
  expected_url = "ma.gnolia.com/atom/full/people/#{user}"
  @http_service.requested_url.should eql(expected_url)
end