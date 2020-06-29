class Blog < ApplicationRecord
  attachment :image
  belongs_to :category,optional: true
  belongs_to :user
  has_many :blog_comments
  validates :title, presence: true # この行を追加
end
