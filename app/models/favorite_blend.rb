class FavoriteBlend < ApplicationRecord
  belongs_to :user
  belongs_to :my_blend
end