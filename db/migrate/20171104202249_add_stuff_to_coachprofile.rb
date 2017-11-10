class AddStuffToCoachprofile < ActiveRecord::Migration[5.0]
  def change
    add_column :coachprofiles, :phonenumber, :string
    add_column :coachprofiles, :location, :boolean
    add_column :coachprofiles, :address, :string
    add_column :coachprofiles, :firstname, :string
    add_column :coachprofiles, :lastname, :string
    add_column :coachprofiles, :username, :string
  end
end
