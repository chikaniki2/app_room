class Room < ApplicationRecord
  belongs_to :user , optional: true#post index
  has_many :user_rooms
  has_many :users, through: :user_rooms

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true

  mount_uploader :image, ImageUploader

end
