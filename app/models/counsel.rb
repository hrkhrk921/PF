class Counsel < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :counsel_comments, dependent: :destroy
  validates :title, presence: { message: 'タイトルを入力してください' }
  validates :body, presence: { message: '本文を入力してください' }
end
