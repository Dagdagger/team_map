class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 validates_acceptance_of :terms
 after_create :create_profile
 has_many :instamessages
 has_many :conversations, foreign_key: :sender_id
 has_one :event, dependent: :destroy
 has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
 has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'
 acts_as_votable
 acts_as_voter
 acts_as_followable
 acts_as_follower
 groupify :group_member
 groupify :named_group_member
 belongs_to :attendance
 has_one :profile, dependent: :destroy
 has_many :chat_rooms, dependent: :destroy
 has_many :messages, dependent: :destroy
 has_many :sports, through: :profile
 accepts_nested_attributes_for :profile
 def emailname
	 email.split('@')[0]
 end
end
