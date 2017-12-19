class Event < ApplicationRecord

	def self.search(search)
			if search
						find(:all, :conditions => ['name LIKE ?', "%#(search)%"])
							else
									find(:all)
			end
	end

	belongs_to :user
	geocoded_by :address
	after_validation :geocode, if: -> (obj){ obj.address.present? and obj.address_changed? }

end
