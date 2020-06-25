class Blog < ApplicationRecord
  attachment :image
  belongs_to :category,optional: true
  belongs_to :user
  has_many :blog_comments
end
