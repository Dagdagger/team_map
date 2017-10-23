class ForeignKeys < ActiveRecord::Migration[5.0]
  def change
	  add_foreign_key :sports, :profiles
  end
end
