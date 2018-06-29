class Charge < ApplicationRecord
  belongs_to :coachprofile
  belongs_to :user
end
