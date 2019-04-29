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
  validate :future_date_prohibited

  mount_uploader :icon, IconUploader

  private

  def future_date_prohibited
    if purchase_date.present? && purchase_date > Date.today
      errors.add(:base, "未来の日付は入力できません")
    end
  end
end
