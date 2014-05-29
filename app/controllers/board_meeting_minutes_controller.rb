class BoardMeetingMinutesController < ApplicationController
  before_action :authenticate_user!
  def index
    @board_meeting_minutes = BoardMeetingMinute.all
  end

  def new
    @board_meeting_minute = BoardMeetingMinute.new
    @board_members = Resident.board_members
  end
end