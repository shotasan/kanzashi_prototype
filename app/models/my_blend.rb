class MyBlend < ApplicationRecord
  belongs_to :user
  has_one :taste, as: :tasteable, dependent: :destroy
  accepts_nested_attributes_for :taste, allow_destroy: true
end
