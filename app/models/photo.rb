class Photo < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :favorites
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
