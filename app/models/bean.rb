class Bean < ApplicationRecord
  belongs_to :user

  mount_uploader :icon, IconUploader
end
