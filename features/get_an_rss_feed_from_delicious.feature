Feature: request a user's recent bookmarks from delicious
  As a user of tRuTag and Delicious
  I want to get an rss feed of my bookmarks from Delicious
  So that I can use them with tRuTag

  Scenario: user requests a feed for a delicious user
    Given the mock http service is using deliciousRSS_tRuTagTest.rss
    And an http service
    And DeliciousRssService is used to get the document
    And the target user is set to tRuTagTest
    And the service gets the document
    Then the service will request a feed for tRuTagTest
    
  Scenario: user requests a feed of 100 items for a delicious user
    Given the mock http service is using deliciousRSS_tRuTagTest.rss
    And an http service
    And DeliciousRssService is used to get the document
    And the target user is set to tRuTagTest
    And the count is set to 100
    And the service gets the document
    Then the service will request a feed for tRuTagTest
    And the request will be for 100 items
    
  Scenario: user requests a feed for all delicious users
    Given the mock http service is using deliciousRSS_tRuTagTest.rss
    And an http service
    And DeliciousRssService is used to get the document
    And the service gets the document
    Then the service will request a feed for all users
    
  Scenario: user requests a feed for all delicious users for a specific tag
    Given the mock http service is using deliciousRSS_tRuTagTest.rss
    And an http service
    And DeliciousRssService is used to get the document
    And the target user is set to tRuTagTest
    And the count is set to 100
    And the tag is set to ruby
    And the service gets the document
    Then the service will request a feed for all users
    And the request will be for the tag ruby
    
  Scenario: user requests a feed of 100 items for a delicious user and tag
    Given the mock http service is using deliciousRSS_tRuTagTest.rss
    And an http service
    And DeliciousRssService is used to get the document
    And the target user is set to tRuTagTest
    And the count is set to 100
    And the tag is set to ruby
    And the service gets the document
    Then the service will request a feed for tRuTagTest
    And the request will be for 100 items
    And the request will be for the tag ruby
    