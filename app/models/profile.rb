class Profile < ApplicationRecord

	mount_uploader :image, ImageUploader
	belongs_to :user, dependent: :destroy
	has_many :sports, inverse_of: :profile
	accepts_nested_attributes_for :sports

end
