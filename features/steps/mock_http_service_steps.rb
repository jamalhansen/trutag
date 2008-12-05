Given /^the mock http service is using ([\w\-\.]*)$/ do |file|
  @file = "files/#{file}"
end

Given /^an http service$/ do 
  @http_service = TRuTag::MockHttpService.new(:source_file => @file)
  #@http_service = TRuTag::HttpService.new
end

Then /^it should look like an http service$/ do
  @http_service.read_timeout.should eql(5)
  @http_service.source_file.should eql('files/deliciousRSS_tRuTagTest.rss')
  @http_service.open_timeout.should eql(5)
  @http_service.http_code.should eql(nil)
end

When /^the mock http service is used$/ do
  @doc = @http_service.get("www.google.com/")
end

Then /^it should behave like an http service$/ do
  @http_service.http_code.should eql("200")
  @doc.should_not eql(nil)
  file = File.new(File.dirname(__FILE__) + '/files/deliciousRSS_tRuTagTest.rss')
  @doc.should eql(file.read)
end