class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 after_create :create_profile
 has_one :event 
 has_one :profile
 has_many :chat_rooms, dependent: :destroy
 has_many :messages, dependent: :destroy
 has_many :sports, through: :profile
 accepts_nested_attributes_for :profile
 def name
	 email.split('@')[0]
 end

end
