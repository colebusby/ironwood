class BoardMeetingMinutesController < ApplicationController
  before_action :authenticate_user!
  def index
    @meeting_minutes_by_years = BoardMeetingMinute.by_years
  end

  def new
    @board_meeting_minute = BoardMeetingMinute.new
    @board_members = Resident.board_members
  end

  def create
    board_meeting_minute = BoardMeetingMinute.new(board_meeting_minute_params)
    if board_meeting_minute.save
      params[:reports].first.each do |report|
        Report.create!(board_meeting_minute: board_meeting_minute, resident_id: report.first.to_i, description: report.last)
      end
      flash[:success] = "Board Meeting Minutes for #{board_meeting_minute.meeting_date.strftime("%B %d, %Y")} successfuly created."
      redirect_to board_meeting_minutes_path
    else
      flash[:error] = "Something went wrong. Please try again."
      render new_board_meeting_minute_path
    end
  end

  private

  def board_meeting_minute_params
    params.require(:board_meeting_minute).permit(:meeting_date)
  end
end