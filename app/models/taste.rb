class Taste < ApplicationRecord
  belongs_to :tasteable, polymorphic: true

  validates :impression, presence: true, length: { maximum: 1000 }
  validates :bitter, :acidity, :rich, :sweet, :aroma,
             presence:  true, inclusion: { in: [1, 2, 3, 4, 5]}
end