class BoardMeetingMinutesController < ApplicationController
  before_action :authenticate_user!
  def index
    @board_meeting_minute = BoardMeetingMinute.new
  end
end