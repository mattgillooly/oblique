Given /^I am a signed in user$/ do
  set_omniauth()

  visit root_path

  click_on "Sign in with Twitter"
end

When /^I enter a tweet$/ do
  @quip_text = "This is my witty quote"

  fill_in 'quip_text', with: @quip_text
  click_button 'Add'
end

Then /^it is added to the list$/ do
  should have_content @quip_text
end
