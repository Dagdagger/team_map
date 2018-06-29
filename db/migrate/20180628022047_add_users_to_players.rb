class AddUsersToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_reference :players, :users, foreign_key: true
  end
end
