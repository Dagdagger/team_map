class AddTextToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :description, :text
  end
end
