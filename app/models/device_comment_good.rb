class DeviceCommentGood < ApplicationRecord

  has_many :device_comments
  has_many :users

end
