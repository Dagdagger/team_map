class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 after_create :create_profile
 has_many :events 
 has_one :profile
 accepts_nested_attributes_for :profile
end
