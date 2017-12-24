class AddUsernameToInvites < ActiveRecord::Migration[5.0]
  def change
    add_column :invites,:username, :string
  end
end
