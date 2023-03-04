class DeviceGenre < ApplicationRecord
  
  has_many :devices
  validates :device_genre_name, presence:true, uniqueness: true
  
end
