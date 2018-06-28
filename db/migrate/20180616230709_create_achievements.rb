class CreateAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :achievements do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
