class ChatRoom < ApplicationRecord
  belongs_to :users 
  has_many :messages, dependent: :destroy
end
