class Profile < ApplicationRecord


	acts_as_votable
	mount_uploader :image, ImageUploader
	belongs_to :user, dependent: :destroy
	has_many :sports, inverse_of: :profile
	has_many :achievements
	accepts_nested_attributes_for :sports

end
