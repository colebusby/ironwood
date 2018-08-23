class AddUploadToBoardMeetingMinutes < ActiveRecord::Migration
  def change
    add_column :board_meeting_minutes, :upload, :string
  end
end
