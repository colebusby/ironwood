class Resident < ActiveRecord::Base
  belongs_to :user
  has_many :board_positions
  has_many :reports

  def has_board_position?(board_position_id)
    self.board_positions.find_by_id(board_position_id).present?
  end

  def clear_board_positions
    if self.board_positions.present?
      self.board_positions.each do |board_position|
        board_position.update_attribute(:resident_id, nil)
      end
    end
  end

  def self.board_members
    board_members = []
    BoardPosition.all.each do |position|
      board_members << position.resident unless board_members.include?(position.resident) || position.resident == nil
    end
    board_members
  end

  def positions
    positions = []
    self.board_positions.each do |board_position|
      positions << board_position.title
    end
    positions
  end

  def title
    "#{self.positions.join(", ").capitalize}."
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end