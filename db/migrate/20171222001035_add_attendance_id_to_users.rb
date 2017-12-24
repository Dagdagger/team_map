class AddAttendanceIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :attendance_id, :integer
  end
end
