class BoardMeetingMinutesController < ApplicationController
  before_action :authenticate_user!
  def index
    @meeting_minutes_by_years = BoardMeetingMinute.by_years
    @board_meeting_minute = BoardMeetingMinute.new
    @board_meeting_minutes = BoardMeetingMinute.all
  end

  def new
    @board_meeting_minute = BoardMeetingMinute.new
    @board_members = Resident.board_members
  end

  def create
    board_meeting_minute = BoardMeetingMinute.new(board_meeting_minute_params)
    if board_meeting_minute.save
      flash[:success] = "Minutes uploaded"
      redirect_to board_meeting_minutes_path
    else
      flash[:error] = "Upload failed"
      render board_meeting_minutes_path
    end
  end

  def create_old
    board_meeting_minute = BoardMeetingMinute.new(board_meeting_minute_params)
    if board_meeting_minute.save
      params[:reports].first.each do |report|
        resident = Resident.find(report.first.to_i)
        Report.create!(board_meeting_minute: board_meeting_minute, resident_id: resident.id, description: report.last, title: resident.title, resident_name: resident.full_name)
      end
      flash[:success] = "Board Meeting Minutes for #{board_meeting_minute.meeting_date.strftime("%B %d, %Y")} successfuly created."
      redirect_to board_meeting_minutes_path
    else
      flash[:error] = "Something went wrong. Please try again."
      render new_board_meeting_minute_path
    end
  end

  def show
    @board_meeting_minute = BoardMeetingMinute.find(params[:id])
  end

  def destroy
     board_meeting_minute = BoardMeetingMinute.find(params[:id])
     board_meeting_minute.destroy
     flash[:notice] = "File has been deleted."
     redirect_to board_meeting_minutes_path
  end


  private

  def board_meeting_minute_params
    params.require(:board_meeting_minute).permit(:meeting_date, :upload)
  end
end
