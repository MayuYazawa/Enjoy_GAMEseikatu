class DeviceGood < ApplicationRecord
  
  belongs_to :user
  has_many :devices
end
