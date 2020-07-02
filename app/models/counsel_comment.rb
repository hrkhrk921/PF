class CounselComment < ApplicationRecord
  belongs_to :user
  belongs_to :counsel
  belongs_to :parent,  class_name: "CounselComment", optional: true
   has_many   :replies, class_name: "CounselComment", foreign_key: :parent_id, dependent: :destroy
end
