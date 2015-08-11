class HomeownersController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:last_name]
      @users = User.directory_last_name_sort
    elsif params[:unit_order]
      @users = User.order('unit')
    else
      session[:address] = !session[:address] if params[:address]
      session[:address] ? @users = User.order('address') : @users = User.by_street
    end
  end
end
