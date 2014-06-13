class UsersController < ApplicationController

  def show
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

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation)
  end
end