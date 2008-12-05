Feature: request a feed from blogger
  As a user of tRuTag
  I want to get an atom feed of a blog from magnolia
  So that I can use the tags with tRuTag
  
  Scenario: user requests a feed from magnolia
    Given the mock http service is using magnolia_tag_atom.xml
    And an http service
    And MagnoliaAtomService is used to get the document
    And the tag is set to ruby
    And the service gets the document
    Then MagnoliaAtomService requests an atom feed for the tag ruby
    
  Scenario: user requests a feed from magnolia
    Given the mock http service is using magnolia_user_atom.xml
    And an http service
    And MagnoliaAtomService is used to get the document
    And the target user is set to rubyyot
    And the service gets the document
    Then MagnoliaAtomService requests an atom feed for the user rubyyot