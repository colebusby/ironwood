class AddResidentIdFromReports < ActiveRecord::Migration
  def change
    add_column :reports, :resident_id, :integer
  end
end
