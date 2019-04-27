class Bean < ApplicationRecord
  belongs_to :user
  has_many :favorite_bean, dependent: :destroy
  has_one :taste, as: :tasteable, dependent: :destroy
  accepts_nested_attributes_for :taste, allow_destroy: true

  validates :name, presence: true, length: { maximum: 30 }
  validates :country, length: { maximum: 30 }
  validates :plantation, length: { maximum: 30 }
  validates :roasted, length: { maximum: 30 }
  validates :grind, length: { maximum: 30 }
  validates :store, length: { maximum: 30 }
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100_000 }
  validates :description, length: { maximum: 1000 }

  mount_uploader :icon, IconUploader
end
