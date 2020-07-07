class Photo < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :favorites
  validates :image, presence: { message: '画像を選択してください' }
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
