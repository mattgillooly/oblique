class RandomTweeter

  def post_tweets
    puts "RandomTweeter#post_tweets"
    puts "User.count: #{User.count}"
    User.hourly_tweeters.find_each do |user|
      puts "barfight"
      post_random_quip_for_user(user)
    end
    puts "okay"
  end

  def post_random_quip_for_user(user)
    puts "RandomTweeter#post_random_quip_for_user(#{user.inspect})"
    quips = user.quips
    puts "..quips: #{quips.inspect}"
    quip = quips[rand(quips.count)]
    puts "..picked: #{quip.inspect}"
    PostTweets.new.post(user, quip.text)
  end

end
