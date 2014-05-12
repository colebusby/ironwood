class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :board_meeting_minute_id
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
