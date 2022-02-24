class Room < ApplicationRecord
  belongs_to :user , optional: true#post index
  has_many :user_rooms
  has_many :users, through: :user_rooms
end
