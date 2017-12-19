class AddDisplaynameToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :displayname, :string
    add_column :profiles, :string, :string
  end
end
