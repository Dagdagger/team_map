class AddCoachIdToCoachprofile < ActiveRecord::Migration[5.0]
  def change
    add_column :coachprofiles, :coach_id, :string
  end
end
