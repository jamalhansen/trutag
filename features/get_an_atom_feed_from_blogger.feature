Feature: request a feed from blogger
  As a user of tRuTag
  I want to get an atom feed of a blog from blogger
  So that I can use the tags with tRuTag
  
  Scenario: user requests a feed for blogger blog
    Given the mock http service is using blogger_on-ruby_atom.xml
    And an http service
    And BloggerAtomService is used to get the document
    And the target user is set to on-ruby
    And the service gets the document
    Then the service will request an atom feed for on-ruby

  Scenario: user requests a feed for another blogger blog
    Given the mock http service is using blogger_on-ruby_atom.xml
    And an http service
    And BloggerAtomService is used to get the document
    And the target user is set to netninjas
    And the service gets the document
    Then the service will request an atom feed for netninjas