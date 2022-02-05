class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reservations

  mount_uploader :room_image, AvatarUploader

  validates :room_name, presence: true
  validates :room_introduction, presence: true
  validates :room_price, presence: true
  validates :room_address, presence: true
  validates :room_image, presence: true
end
