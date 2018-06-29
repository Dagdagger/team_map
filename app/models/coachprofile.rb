class Coachprofile < ApplicationRecord


  acts_as_votable
  mount_uploader :image, ImageUploader
  belongs_to :coach
  has_many :reviews
  has_many :charges

end
