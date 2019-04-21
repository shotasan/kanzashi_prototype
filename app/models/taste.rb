class Taste < ApplicationRecord
  belongs_to :tasteable, polymorphic: true
end
