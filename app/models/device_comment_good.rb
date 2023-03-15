class DeviceCommentGood < ApplicationRecord

  has_many :device_comments
  belongs_to :user

end
