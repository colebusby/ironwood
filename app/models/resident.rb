class Resident < ActiveRecord::Base
  belongs_to :user
  has_many :board_positions
end