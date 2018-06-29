class Supamessage < ApplicationRecord
  belongs_to :instaconvo
  belongs_to :user

  validates_presence_of :body, :instaconvo_id, :user_id
end
