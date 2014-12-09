class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.string :email

      t.timestamps null: false#keeps track of when the table is created at and updated at
    end
  end
end
