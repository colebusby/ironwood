class Report < ActiveRecord::Base
  belongs_to :board_meeting_minute
  belongs_to :user

end