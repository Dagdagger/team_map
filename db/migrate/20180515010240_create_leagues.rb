class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.text :description
      t.integer :num_teams
      t.string :sport
      t.string :location

      t.timestamps
    end
  end
end
