class ResidentsController < ApplicationController
  before_filter :find_user

  def index
  end

  private

  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end
end