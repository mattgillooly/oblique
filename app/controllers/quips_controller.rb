class QuipsController < ApplicationController

  respond_to :html
  respond_to :json, only: :index

  before_filter :authenticate

  def index
    @quips = current_user.quips

    respond_to do |format|
      format.js { render json: @quips }
      format.html
    end
  end

  def new
    @quip = current_user.quips.build(params[:quip])
  end

  def create
    @quip = current_user.quips.create(params[:quip])

    redirect_to quips_path
  end

  def edit
    @quip = current_user.quip.find(params[:id])
  end

  def update
    @quip = current_user.quips.find(params[:id])
    @quip.update_attributes(params[:quip])

    redirect_to quips_path
  end

end
