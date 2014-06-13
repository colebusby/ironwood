class AddTitleAndResidentNameToBoardMeetingMinute < ActiveRecord::Migration
  def change
    add_column :reports, :title, :string
    add_column :reports, :resident_name, :string
  end
end
