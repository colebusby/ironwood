class HomeownersController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:last_name]
      @users = User.directory_last_name_sort
    elsif params[:unit_order]
      @users = User.order('unit')
    else
      session[:address] = !session[:address] if params[:address]
      if session[:address]
        @user = User.by_street
      else
        @users = User.order('address')
      end
    end
  end
end
