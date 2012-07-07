require 'spec_helper'

describe PostTweets do

  let(:user) { stub(:user) }
  let(:text) { 'Hello Twitter' }

  it "posts a tweet" do
    PostTweets.delivery_method = :normal

    twitter = stub(:twitter)
    user.stub(:twitter).and_return(twitter)
    twitter.should_receive(:update).with(text)

    subject.post(user, text)
  end

  it "stores a delivery in test mode" do
    PostTweets.delivery_method = :test

    subject.post(user, text)

    PostTweets.deliveries.should == [ [user, text] ]
  end

end
