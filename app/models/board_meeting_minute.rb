class BoardMeetingMinute < ActiveRecord::Base
  has_many :reports

  def self.by_years
    by_years_hash = {}
    self.order("meeting_date DESC").all.each do |board_meeting_minute|
      meeting_year = "#{board_meeting_minute.meeting_date.strftime("%Y")}"
      by_years_hash[meeting_year] = [] unless by_years_hash.include?(meeting_year)
      by_years_hash[meeting_year] << board_meeting_minute
    end
    by_years_hash
  end

  def readable_month_day
    self.meeting_date.strftime("%B %d")
  end

  def readable_date
    self.meeting_date.strftime("%B %d, %Y")
  end

end