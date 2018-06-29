class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
 validates_acceptance_of :terms
 has_many :instaconvos, :foreign_key => :sender_id
 after_create :create_profile, :create_default_conversation
 has_many :instamessages
 has_many :games
 has_many :photos
 has_many :charges
 has_many :conversations, foreign_key: :sender_id
 has_one :event, dependent: :destroy
 has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
 has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'
 has_many :notifications
 acts_as_votable
 acts_as_voter
 acts_as_followable
 acts_as_follower
 groupify :group_member
 groupify :named_group_member
 belongs_to :gameparticipants
 belongs_to :attendance
 has_one :profile, dependent: :destroy
 has_many :chat_rooms, dependent: :destroy
 has_many :messages, dependent: :destroy
 has_many :sports, through: :profile
 has_many :reviews
 accepts_nested_attributes_for :profile
 def emailname
	 email.split('@')[0]
 end


 def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
  end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
  end
end

 private

 def create_default_conversation
    Instaconvo.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
 end
end
