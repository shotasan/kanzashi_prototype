class MyBlend < ApplicationRecord
  belongs_to :user
  # has_one :taste, as: :tasteable, dependent: :destroy

end
