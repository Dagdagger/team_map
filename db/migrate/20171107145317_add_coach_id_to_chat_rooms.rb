class AddCoachIdToChatRooms < ActiveRecord::Migration[5.0]
  def change
      add_column :chat_rooms, :references, :coach, foreign_key: true
  end
end
