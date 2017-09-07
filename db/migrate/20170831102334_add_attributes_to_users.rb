class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
	  add_column :users, :username, :string
	  add_index :users, :username, unique: true
	  add_column :users, :lastname, :string
	  add_column :users, :gender, :string
	  add_column :users, :preferredsport, :string
  end
end
