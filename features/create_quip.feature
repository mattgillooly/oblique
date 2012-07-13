Feature: Create quip

  In order to add a quip to my lineup
  As a user
  I want to create a quip

  Scenario: First quip
    Given I am a signed in user
    When I go to manage my quipset
    And I enter a quip
    Then it is added to the list

