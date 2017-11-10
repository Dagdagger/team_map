class CreateCoachprofiles < ActiveRecord::Migration[5.0]
  def change
    create_table :coachprofiles do |t|
      t.datetime :birthdate
      t.string :sport
      t.integer :price
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
