class Bean < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 1000 }

  mount_uploader :icon, IconUploader
end
