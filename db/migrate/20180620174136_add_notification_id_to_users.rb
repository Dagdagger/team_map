class AddNotificationIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :notification_id, :integer
  end
end
