class RemoveUserAddResidentIdToBoardPosition < ActiveRecord::Migration
  def change
    remove_column :board_positions, :user_id
    add_column :board_positions, :resident_id, :integer
  end
end
