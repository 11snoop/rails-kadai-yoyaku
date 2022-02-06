class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reservations, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :email, uniqueness: true, presence: true
  #validates :password, presence: true, length: { in: 8..16 }
end
