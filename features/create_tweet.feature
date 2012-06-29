Feature: Create tweet

  In order to add a tweet to my lineup
  As a user
  I want to create a tweet

  Scenario: First tweet
    Given I am a signed in user
    When I enter a tweet
    Then it is added to the list

