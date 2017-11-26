class AddImageToCoachprofiles < ActiveRecord::Migration[5.0]
  def change
    add_column :coachprofiles,:image,:string
  end
end
