class TweetsController < ApplicationController

  before_filter :authenticate

  def index
    @tweets = current_user.tweets
    @tweet = Tweet.new #current_user.tweets.build(params[:tweet])
  end

  def new
    @tweet = current_user.tweets.build(params[:tweet])
  end

  def create
    @tweet = current_user.tweets.create(params[:tweet])

    redirect_to tweets_path
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  def update
    @tweet = current_user.tweets.find(params[:id])
    @tweet.update_attributes(params[:tweet])

    redirect_to tweets_path
  end

private

  def authenticate
    unless current_user
      redirect_to root_path
      return false
    end
  end

end
