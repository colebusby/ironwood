class RenameUserIdToResidentIdInBoardPositions < ActiveRecord::Migration
  def change
    rename_column :board_positions, :user_id, :resident_id
  end
end
