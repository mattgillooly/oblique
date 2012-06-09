class TweetsController < ApplicationController

  before_filter :authenticate

  def index
    @tweets = current_user.tweets
  end

  def create
    @tweet = current_user.tweets.create(params[:tweet])
  end

private

  def authenticate
    unless current_user
      redirect_to root_path
      return false
    end
  end

end
