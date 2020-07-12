class Blog < ApplicationRecord
  attachment :image
  belongs_to :category,optional: true
  belongs_to :user
  has_many :blog_comments, dependent: :destroy
  validates :title, presence: { message: 'タイトルを入力してください' }
  validates :category, presence: { message: 'カテゴリーを選択してください' }
  validates :body, presence: { message: '本文を入力してください' }
end
