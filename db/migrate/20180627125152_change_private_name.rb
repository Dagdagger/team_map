class ChangePrivateName < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :private, :privacy
  end
end
