class RandomTweeter

  def post_tweets
    User.find_each do |user|
      post_random_quip_for_user(user)
    end
  end

  def post_random_quip_for_user(user)
    tweets = user.tweets
    tweet = tweets[rand(tweets.count)]
    PostTweets.new.post(user, tweet.text)
  end

end
