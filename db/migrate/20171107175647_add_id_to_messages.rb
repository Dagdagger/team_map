class AddIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :references, :coach, foreign_key: true
    add_column :messages, :coach_id, :string
  end
end
