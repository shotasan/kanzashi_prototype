class Taste < ApplicationRecord
  belongs_to :tasteable, polymorphic: true

  validates :impression, presence: true, length: { maximum: 1000 }
  validates :bitter, :acidity, :rich, :sweet, :aroma,
             presence:  true,
             numericality: {
                 only_integer: true,
                 greater_than_or_equal_to: 1,
                 less_than_or_equal_to: 5
             }
end