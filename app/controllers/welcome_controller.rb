class WelcomeController < ApplicationController

  def index
    redirect_to tweets_path if current_user
  end

end
