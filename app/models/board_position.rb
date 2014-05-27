class BoardPosition < ActiveRecord::Base
  belongs_to :resident, dependent: :destroy

  CEMENT = 1
  OVERALL_CONDITION_OF_CONDOS = 2
  GROUNDS_NORTH_SIDE = 3
  GROUNDS_SOUTH_SIDE = 4
  SNOW_REMOVAL = 5
  PAINTING = 6
  ROOFING_AND_RAIN_GUTTERS = 7
  SECRETARY = 8
  RV_LOT = 9
  TREASURER = 10
  INSURANCE = 11

end