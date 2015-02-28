class CreateBudgetModel < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :name
      t.string :upload

      t.timestamps
    end
  end
end
