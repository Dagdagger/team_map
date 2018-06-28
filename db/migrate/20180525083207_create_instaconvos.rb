class CreateInstaconvos < ActiveRecord::Migration[5.0]
  def change
    create_table :instaconvos do |t|
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end


    add_index :instaconvos, :sender_id
    add_index :instaconvos, :recipient_id
  end
end
