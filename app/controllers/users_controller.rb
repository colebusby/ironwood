class UsersController < ApplicationController

  def show
    # meaningless comment so I can push to heroku
    @user = User.find(params[:id]) if params[:id]
  end

  def update_password
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "show"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.readable_address} successfuly created."
      redirect_to new_user_path
    else
      render 'new'
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:address, :password, :password_confirmation)
  end
end