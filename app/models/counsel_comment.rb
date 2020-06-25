class CounselComment < ApplicationRecord
  belongs_to :user
  belongs_to :counsel
end
