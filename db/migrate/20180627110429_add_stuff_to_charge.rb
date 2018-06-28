class AddStuffToCharge < ActiveRecord::Migration[5.0]
  def change
    add_reference :charges, :coachprofile, index: true
    add_reference :charges, :user, index: true
    add_column :charges, :amount, :decimal, :precision => 4, :scale => 2
  end
end
