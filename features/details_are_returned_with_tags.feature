Feature: relevent stats are returned with tags
  As a user of tRuTag
  I want to be able to see some details about the tags
  So that I can appease my inner statistician
  
  Scenario: tags have details
    When looking at tag details
    Then relevent stats should be available
    
  Scenario: compating tag details
    When comparing at tag details
    Then guid should be used
    And parent should be used if guid is nil
  
  