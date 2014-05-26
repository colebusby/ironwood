class ResidentsController < ApplicationController
  before_filter :find_user

  def index
    @resident = Resident.new
  end

  def create
    receive_notifications = params[:receive_notifications].present? ? true : false
    resident = Resident.new(user_id: params[:user_id], first_name: params[:first_name], last_name: params[:last_name], email: params[:email], receive_notifications: receive_notifications, phone1: params[:phone1], phone2: params[:phone2])
    if resident.save
      flash[:success] = "#{resident.first_name} #{resident.last_name} has been successfully added"
      redirect_to user_residents_path(params[:user_id])
    else
      flash[:error] = "Please check entries and try again"
      render user_residents_path(params[:user_id])
    end
  end

  def edit
    @resident = Resident.find(params[:id])
  end

  private

  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end
end