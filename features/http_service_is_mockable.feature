Feature: http_service is mockable
  As a tester of tRuTag
  I want to be able to mock the http service
  So that I can test without accessing the internet
  
  Scenario: mock http service is created
    Given the mock http service is using deliciousRSS_tRuTagTest.rss
    And an http service
    Then it should look like an http service  
  
  Scenario: mock service is used
    Given the mock http service is using deliciousRSS_tRuTagTest.rss
    And an http service
    When the mock http service is used
    Then it should behave like an http service  