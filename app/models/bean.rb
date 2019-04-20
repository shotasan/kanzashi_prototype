class Bean < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 30 }
  validates :country, length: { maximum: 30 }
  validates :plantation, length: { maximum: 30 }
  validates :roasted, length: { maximum: 30 }
  validates :grind, length: { maximum: 30 }
  validates :store, length: { maximum: 30 }
  validates :description, length: { maximum: 1000 }

  mount_uploader :icon, IconUploader
end
