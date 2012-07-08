class WelcomeController < ApplicationController

  def index
    redirect_to app_path if current_user
  end

  def app
  end

end
