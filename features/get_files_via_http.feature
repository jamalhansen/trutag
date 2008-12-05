Feature: can get files from the internet via http
  As a user of tRuTag
  I want to to get files from the internet
  So that I can use them with tRuTag
  
  Scenario: service is created with defaults
    Given a default http service
    Then the http service must have a read timeout of 5
    And the http service should have an open timeout of 5
    And have a nil http code
    
  Scenario: service is created with defaults
    Given an http service created with a read timeout of 10 and an open timeout of 10
    Then the http service must have a read timeout of 10
    And the http service should have an open timeout of 10

  Scenario: a document is requested
    Given a default http service
    When get is called
    Then a document is returned via http
    And the http code is 200