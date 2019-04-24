class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :my_blend

  validates :content, presence: true, length: { maximum: 1000 }
end
