Given /^I am a signed in user$/ do
  set_omniauth()

  visit root_path

  click_on "Sign in with Twitter"
end

Given /^I have connected my Twitter account$/ do
  # no-op for now, while all sign-ins are via Twitter
end

