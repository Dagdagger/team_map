class AddIdToChatRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :coach_id, :string
  end
end
