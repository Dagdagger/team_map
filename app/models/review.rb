class Review < ApplicationRecord

  belongs_to :coachprofile
  belongs_to :user
  acts_as_votable
end
