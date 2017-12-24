class AddStuffToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :descriptions, :text
    add_column :groups, :sport, :string
    add_column :groups, :name, :string
  end
end
