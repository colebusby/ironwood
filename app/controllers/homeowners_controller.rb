class HomeownersController < ApplicationController
  before_action :authenticate_user!
  def index
    users_last_name = User.directory_last_name_sort
    users_address = User.order('address')
    if params[:last_name]
      @users = users_last_name
    else
      @users = users_address
    end
  end
end