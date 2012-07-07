Given /^I have added quips to my account$/ do
  steps %{
    Given I am a signed in user
    And I enter a tweet
    And I enter a tweet
  }
end

Given /^I have enabled hourly tweets$/ do
  #TODO: hook up to UI
  User.first.update_attribute(:tweet_hourly, true)
end

Given /^I have connected my Twitter account$/ do
  # no-op for now, while all sign-ins are via Twitter
end

When /^the hourly task to post tweets runs$/ do
  invoke_twitter_rake('post_random_tweets')
  #RandomTweeter.new.post_tweets
end

Then /^one of my quips is tweeted on my behalf$/ do
  PostTweets.should have(1).deliveries

  d = PostTweets.deliveries.first
  d.last.should == 'This is my witty quote'
end
