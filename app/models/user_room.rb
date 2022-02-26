class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :member, presence: true
  validates :price, presence: true

end
