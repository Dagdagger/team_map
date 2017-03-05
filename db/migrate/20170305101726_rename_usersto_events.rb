class RenameUserstoEvents < ActiveRecord::Migration[5.0]
  def change
	rename_table :users, :events
  end
end
