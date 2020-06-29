class Counsel < ApplicationRecord
	attachment :image
	belongs_to :user
	has_many :counsel_comments
end
