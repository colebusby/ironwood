class ResidentsController < ApplicationController
  before_filter :find_user

  def index
    @resident = Resident.new
  end

  def create
    resident = Resident.new(resident_params)
    if resident.save
      flash[:success] = "#{resident.first_name} #{resident.last_name} has been successfully added"
      redirect_to residents_path(user_id: resident.user)
    else
      flash[:error] = "Please check entries and try again"
      redirect_to residents_path(user_id: resident.user)
    end
  end

  def edit
    @resident = Resident.find(params[:id])
  end

  def update
    @resident = Resident.find(params[:id])
    if resident_params.present? || params[:board_positions].present?
      @resident.update_attributes(resident_params) if resident_params.present?
      @resident.clear_board_positions
      if params[:board_positions].present?
        params[:board_positions].each do |board_position_id|
          board_position = BoardPosition.find(board_position_id)
          board_position.update_attribute(:resident_id, @resident.id)
        end
      end
      @resident.user.handle_board_member_role
      flash[:success] = "#{@resident.first_name} #{@resident.last_name}'s data has been updated."
      redirect_to residents_path(user_id: @resident.user)
    else
      render edit_resident_path(@resident)
    end
  end

  def destroy
    @resident = Resident.find(params[:id])
    @resident.destroy
    flash[:success] = "#{@resident.first_name} #{@resident.last_name} has been removed from #{@resident.user.readable_address}"
    redirect_to residents_path(user_id: @resident.user.id)
  end

  private

  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def resident_params
    params.require(:resident).permit(:user_id, :first_name, :last_name, :email, :receive_notifications, :phone1, :phone2)
  end
end