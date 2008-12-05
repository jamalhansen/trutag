require File.dirname(__FILE__) + '/feature_helper'
require 'delicious_rss_parser'
require 'atom_parser'
require 'tagged_item'


Given /^the parser is an instance of (\w*)$/ do |parser|
  statement = "TRuTag::#{parser}.new"
  @parser = eval(statement)
end

When /^the file is parsed$/ do
  @tag_hash = @parser.parse @doc
end

Then /^a tag hash is returned$/ do
  @tag_hash.class.should eql(Hash)
end

Then /^each key in the tag hash contains an Array$/ do
  @tag_hash.each_value do |value|
    value.class.should eql(Array)
  end
end

Then /^the tag hash contains (\d+) keys$/ do |n|
  @tag_hash.length.should eql(n.to_i)
  
end

Then /^each array in the tag hash contains one or more tagged items$/ do
  @tag_hash.each_value do |value|
    value.length.should be > 0
    value.each do |element|
      element.class.should eql(TRuTag::TaggedItem)
    end
  end
end

Then /^each tagged item has guid, guid_permalink, reference_url, source_url, published_date, and title$/ do
  @tag_hash.each_value do |value|
    value.length.should be > 0
    value.each do |element|
      element.guid.should_not eql(nil)
      element.guid_permalink.should_not eql(nil)
      element.reference_url.should_not eql(nil)
      element.source_url.should_not eql(nil)
      element.published_date.should_not eql(nil)
      element.title.should_not eql(nil)
    end
  end
end
