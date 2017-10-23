class AddSportToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :sport, :string
  end
end
