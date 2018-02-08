class Coach < User
  after_create :create_coachprofile
  has_one :coachprofile, dependent: :destroy
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :coachprofile
  
  def name
 	 email.split('@')[0]
  end
end
