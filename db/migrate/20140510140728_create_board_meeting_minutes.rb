class CreateBoardMeetingMinutes < ActiveRecord::Migration
  def change
    create_table :board_meeting_minutes do |t|
      t.datetime :meeting_date

      t.timestamps
    end
  end
end
