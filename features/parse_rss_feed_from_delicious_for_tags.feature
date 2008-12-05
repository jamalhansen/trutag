Feature: parse rss feed from Delicious for tags
  As a user of tRuTag
  I want to see my tags from Delicious
  So that I can use them with other sites

  Scenario: parser parses the test file and returns a hash
    Given the mock http service is using deliciousRSS_tRuTagTest.rss
    And an http service
    And DeliciousRssService is used to get the document
    And the service gets the document
    And the parser is an instance of DeliciousRssParser
    When the file is parsed
    Then a tag hash is returned
    And each key in the tag hash contains an Array
    And the tag hash contains 12 keys
    And each array in the tag hash contains one or more tagged items
    And each tagged item has guid, guid_permalink, reference_url, source_url, published_date, and title
