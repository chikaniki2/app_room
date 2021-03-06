class User < ApplicationRecord
  has_many :user_rooms
  has_many :rooms #post index
  has_many :rooms, through: :user_rooms

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :description, presence: true

  mount_uploader :image, ImageUploader

end
