class Instaconvo < ApplicationRecord
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  has_many :supamessages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :involving, ->(user) do
    where("instaconvos.sender_id =? OR instaconvos.recipient_id =?",user.id,user.id)
  end

  scope :between, ->(sender_id, recipient_id) do
    where("(instaconvos.sender_id = ? AND instaconvos.recipient_id =?) OR (instaconvos.sender_id = ? AND instaconvos.recipient_id =?)", sender_id, recipient_id, recipient_id, sender_id)
  end

end
