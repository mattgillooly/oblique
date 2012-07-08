require 'spec_helper'

describe RandomTweeter do

  it "posts random tweets for each user" do
    user1 = stub(:user)
    user2 = stub(:user)

    User.stub_chain(:hourly_tweeters, :find_each).and_yield(user1).and_yield(user2)

    subject.should_receive(:post_random_quip_for_user).with(user1)
    subject.should_receive(:post_random_quip_for_user).with(user2)

    subject.post_tweets
  end

  it "posts a random tweet for a user" do
    quip = stub(:tweet, text: "Super wise words!")
    user = stub(:user, quips: [quip])

    PostTweets.any_instance.should_receive(:post).with(user, quip.text)

    subject.post_random_quip_for_user(user)
  end

end
