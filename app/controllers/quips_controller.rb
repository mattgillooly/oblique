class QuipsController < ApplicationController

  respond_to :json

  before_filter :authenticate

  def index
    puts "current_user: #{current_user.inspect}"

    respond_with(@quips = current_user.quips)
  end

  def create
    respond_with(@quip = current_user.quips.create(params[:quip]))
  end

  def show
    respond_with(@quip = current_user.quips.find(params[:id]))
  end

end
