class Event < ApplicationRecord
after_create :create_attendance
include PublicActivity::Model
 tracked only: [:create, :join], owner: Proc.new{ |controller, model| controller.current_user}

	def self.search(search)
			if search
						find(:all, :conditions => ['name LIKE ?', "%#(search)%"])
							else
									find(:all)
			end
	end

	belongs_to :user, optional: false
  has_many :invites
	has_many :users, through: :attendance
	has_one :attendance
	geocoded_by :address
	after_validation :geocode, if: -> (obj){ obj.address.present? and obj.address_changed? }

end
