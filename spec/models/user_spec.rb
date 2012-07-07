require 'spec_helper'

describe User do

  context "a created User" do
    subject { FactoryGirl.create :user }

    it "is not included in the tweet_hourly scope by default" do
      User.hourly_tweeters.should_not include(subject)
    end

    it "is included in the tweet_hourly scope if added" do
      subject.tweet_hourly = true
      subject.save!

      User.hourly_tweeters.should include(subject)
    end
  end

end
