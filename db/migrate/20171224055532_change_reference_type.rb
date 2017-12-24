class ChangeReferenceType < ActiveRecord::Migration[5.0]
  def change
    change_column :chat_rooms, :references, :string
    change_column :messages, :references, :string
  end
end
