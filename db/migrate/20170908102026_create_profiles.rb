class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :age
      t.string :address
      t.text :description
      t.date :birthdate

      t.timestamps
    end
  end
end
