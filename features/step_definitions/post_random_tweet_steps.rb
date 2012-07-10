Given /^I have enabled hourly tweets$/ do
  wait_until { page.body.include?('Will not tweet hourly') }

  page.find(:css, '#tweetHourly').click

  wait_until { page.body.include?('Will tweet hourly') }
end

When /^the hourly task to post tweets runs$/ do
  invoke_twitter_rake('post_random_tweets')
end

Then /^one of my quips is tweeted on my behalf$/ do
  wait_until { PostTweets.deliveries.present? }

  PostTweets.should have(1).deliveries

  d = PostTweets.deliveries.first
  d.last.should == 'This is my witty quote'
end
