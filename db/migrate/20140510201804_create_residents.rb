class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :receive_notifications, default: false
      t.string :phone1
      t.string :phone2

      t.timestamps
    end
  end
end
