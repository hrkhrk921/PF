class Category < ApplicationRecord
  has_many :blogs, dependent: :destroy
  validates :name, presence: { message: '入力してください' }
end
