class RandomTweeter

  def post_tweets
    User.hourly_tweeters.find_each do |user|
      post_random_quip_for_user(user)
    end
  end

  def post_random_quip_for_user(user)
    quips = user.quips
    quip = quips[rand(quips.count)]
    PostTweets.new.post(user, quip.text)
  end

end
