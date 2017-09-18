class UserIdToProfile < ActiveRecord::Migration[5.0]
  def change
	  add_column :profiles, :user_id, :string
  end
end
