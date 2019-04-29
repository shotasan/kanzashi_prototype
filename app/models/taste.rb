class Taste < ApplicationRecord
  belongs_to :tasteable, polymorphic: true

  validates :impression, presence: true, length: { maximum: 1000 }
  validates :bitter, :acidity, :rich, :sweet, :aroma,
             presence:  true, inclusion: { in: [1, 2, 3, 4, 5]}

  def taste_index
    [self.bitter, self.acidity, self.rich, self.sweet, self.aroma]
  end

  def taste_labels
    %w(苦味 酸味 コク 甘み 香り)
  end
end