class AddSportskillToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :skill, :integer
    add_column :profiles, :sportdescription, :text
  end
end
