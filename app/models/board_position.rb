class BoardPosition < ActiveRecord::Base
  belongs_to :resident, dependent: :destroy

  CEMENT = "cement"
  OVERALL_CONDITION_OF_CONDOS = "overall condition of condos"
  GROUNDS_NORTH_SIDE = "grounds-North side"
  GROUNDS_SOUTH_SIDE = "grounds-South side"
  SNOW_REMOVAL = "snow removal"
  PAINTING = "painting"
  ROOFING_AND_RAIN_GUTTERS = "roofing and rain gutters"
  SECRETARY = "secretary"
  RV_LOT = "R.V. Lot"
  TREASURER = "Treasurer"
  INSURANCE = "Insurance"

  def self.board_positions

  end

end