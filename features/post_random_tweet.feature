Feature: Post random tweet

  In order to entertain my followers
  As an oblique user
  I want to post a random tweet from my account to my Twitter account

  Scenario: Hourly rake task
    Given I have added quips to my account
    And I have enabled hourly tweets
    And I have connected my Twitter account
    When the hourly task to post tweets runs
    Then one of my quips is tweeted on my behalf
