class HomeownersController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:last_name]
      session[:sort] = "name"
      @users = User.directory_last_name_sort
    elsif params[:unit_order]
      session[:sort] = "unit"
      @users = User.order('unit')
    else
      session[:address] = !session[:address] if session[:sort] == "address"
      session[:sort] = "address"
      session[:address] ? @users = User.order('address') : @users = User.by_street
    end
  end
end
