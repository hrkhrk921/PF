class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  has_many :blogs
  has_many :counsels
  has_many :photos
  has_many :favorites
  has_many :favorite_photos, through: :favorites, source: :photo
end
