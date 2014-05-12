class AddPositionToBoardPositions < ActiveRecord::Migration
  def change
    add_column :board_positions, :title, :string
  end
end
