class AddAttendanceIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :attendance_id, :integer
  end
end
