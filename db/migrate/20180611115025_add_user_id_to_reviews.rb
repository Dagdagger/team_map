class AddUserIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :coachprofile_id, :integer
  end
end
