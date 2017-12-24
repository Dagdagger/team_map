class Coachprofile < ApplicationRecord


  acts_as_votable
  mount_uploader :image, ImageUploader
  belongs_to :coach
  belongs_to :charge

end
