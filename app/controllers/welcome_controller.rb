class WelcomeController < ApplicationController

  def index
    redirect_to quips_path if current_user
  end

end
