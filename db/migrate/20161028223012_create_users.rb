class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.time :morning_commute, default: "08:00 AM"
      t.time :evening_commute, default: "5:30 PM"
      t.string :profile_photo

      t.timestamps null: false
    end
  end
end
