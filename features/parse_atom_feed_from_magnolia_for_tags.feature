Feature: parse atom feed from Blogger for tags
  As a user of tRuTag
  I want to see a users tags from Magnolia
  So that I can use them with other sites

  Scenario: parser parses a feed requested by tag
    Given the mock http service is using magnolia_tag_atom.xml
    And an http service
    And MagnoliaAtomService is used to get the document
    And the tag is set to ruby
    And the service gets the document
    And the parser is an instance of AtomParser
    When the file is parsed
    Then a tag hash is returned
    And each key in the tag hash contains an Array
    And the tag hash contains 69 keys
    And each array in the tag hash contains one or more tagged items
    And each tagged item has guid, guid_permalink, reference_url, source_url, published_date, and title
    
  Scenario: parser parses a feed requested by user
    Given the mock http service is using magnolia_user_atom.xml
    And an http service
    And MagnoliaAtomService is used to get the document
    And the target user is set to chrisadams
    And the service gets the document
    And the parser is an instance of AtomParser
    When the file is parsed
    Then a tag hash is returned
    And each key in the tag hash contains an Array
    And the tag hash contains 54 keys
    And each array in the tag hash contains one or more tagged items
    And each tagged item has guid, guid_permalink, reference_url, source_url, published_date, and title
