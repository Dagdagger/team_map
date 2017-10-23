class Profile < ApplicationRecord
	belongs_to :user
	has_many :sports, inverse_of: :profile
	accepts_nested_attributes_for :sports

end
