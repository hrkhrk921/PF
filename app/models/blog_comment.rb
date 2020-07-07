class BlogComment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  validates :comment, presence: { message: 'コメントを入力してください' }
end
