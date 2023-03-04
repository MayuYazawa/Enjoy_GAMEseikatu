class Device < ApplicationRecord
  
  has_one_attached :device_image
  
  has_many :device_comments
  belongs_to :device_genre
  
  with_options presence: true do
    validates :device_name
    validates :device_caption
    validates :price
  end
end
