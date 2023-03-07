class DeviceComment < ApplicationRecord
  
  has_many :device_comment_goods
  belongs_to :user
  
end
