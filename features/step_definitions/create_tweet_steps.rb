When /^I go to manage my quipset$/ do
  click_link "Manage"
end

When /^I enter a tweet$/ do
  @quip_text = "This is my witty quote"

  fill_in 'quip_text', with: @quip_text
  click_button 'Add'
end

Then /^it is added to the list$/ do
  should have_content @quip_text
end

Given /^I have added quips to my account$/ do
  steps %{
    Given I am a signed in user
    When I go to manage my quipset
    And I enter a tweet
    And I enter a tweet
  }
end

