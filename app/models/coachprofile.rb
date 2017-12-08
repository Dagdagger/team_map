class Coachprofile < ApplicationRecord

  mount_uploader :image, ImageUploader
  belongs_to :coach
  belongs_to :charge

end
