class DeviceComment < ApplicationRecord
  
  has_many :device_comment_goods
  has_one :user
  
end
