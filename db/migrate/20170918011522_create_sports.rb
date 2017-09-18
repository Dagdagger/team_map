class CreateSports < ActiveRecord::Migration[5.0]
  def change
    create_table :sports do |t|
      t.string :name
      t.integer :skill
      t.text :description

      t.timestamps
    end
  end
end
