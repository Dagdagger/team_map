class AddPhonesToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :phonenumber, :string
    add_column :profiles, :rating, :integer
  end
end
