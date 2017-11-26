class Coachprofile < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  belongs_to :coach
end
