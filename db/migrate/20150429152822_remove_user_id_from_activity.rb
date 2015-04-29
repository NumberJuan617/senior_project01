class RemoveUserIdFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :user_id, :integer
  end
end
