class RemoveZipFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :zip, :integer
  end
end
