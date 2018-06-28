class CreateSupamessages < ActiveRecord::Migration[5.0]
  def change
    create_table :supamessages do |t|
      t.text :body
      t.references :instaconvo, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
