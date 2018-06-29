class Game < ApplicationRecord
  belongs_to :user
  has_many :users, through: :players 
end
