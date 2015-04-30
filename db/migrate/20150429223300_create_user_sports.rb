class CreateUserSports < ActiveRecord::Migration
  def change
    create_table :user_sports do |t|
      t.integer :user_id
      t.integer :sport_id

      t.timestamps null: false
    end
  end
end
