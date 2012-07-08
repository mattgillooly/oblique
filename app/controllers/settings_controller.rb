class SettingsController < ApplicationController

  respond_to :json

  before_filter :authenticate

  def show
    respond_with(@settings = current_user.settings)
  end

  def create
    current_user.settings = Settings.new(params[:tweet_hourly])
    current_user.save!

    head :ok
  end

end
