class Room < ApplicationRecord
  belongs_to :user , optional: true#post index
  has_many :user_rooms
  has_many :users, through: :user_rooms

  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :member, presence: true
  validates :price, presence: true

end
