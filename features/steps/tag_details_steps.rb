When /^looking at tag details$/ do
  @tag_details = TRuTag::TaggedItem.new
end

Then /^relevent stats should be available$/ do
  @tag_details.guid.should eql(nil)
  @tag_details.guid_permalink.should eql(false)
  @tag_details.published_date.should eql(nil)
  @tag_details.reference_url.should eql(nil)
  @tag_details.source_url.should eql(nil)
  @tag_details.title.should eql(nil)
end

When /^comparing at tag details$/ do
  @tag_details_foo1 = TRuTag::TaggedItem.new
  @tag_details_foo2 = TRuTag::TaggedItem.new
  @tag_details_nil1 = TRuTag::TaggedItem.new
  @tag_details_nil2 = TRuTag::TaggedItem.new
  @tag_details_foo1.guid = "foo"
  @tag_details_foo2.guid = "foo"
end

Then /^guid should be used$/ do
  equality = @tag_details_foo1 == @tag_details_foo2
  equality.should eql(true)
  @tag_details_foo1.should_not eql(@tag_details_foo2)
end

Then /^parent should be used if guid is nil$/ do
  equality = (@tag_details_nil1 == @tag_details_nil2)
  equality.should eql(false)
  @tag_details_nil1.should_not eql(@tag_details_nil2)
end