class CreateBoardPositions < ActiveRecord::Migration
  def change
    create_table :board_positions do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
