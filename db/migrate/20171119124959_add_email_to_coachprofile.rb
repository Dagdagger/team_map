class AddEmailToCoachprofile < ActiveRecord::Migration[5.0]
  def change
    add_column :coachprofiles, :email, :string
  end
end
