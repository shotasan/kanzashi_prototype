class MyBlend < ApplicationRecord
  belongs_to :user
  has_one :taste, as: :tasteable, dependent: :destroy
  accepts_nested_attributes_for :taste, allow_destroy: true

  validates :name, presence: true
  validates :choice1, presence: true
  validates :choice2, presence: true
  validates :amount1, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 100 }
  validates :amount2, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 100 }
  validates :description, presence: true, length: { maximum: 1000 }
end
