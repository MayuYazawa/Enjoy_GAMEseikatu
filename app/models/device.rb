class Device < ApplicationRecord
  
  has_one_attached :device_image
  
  has_many :device_comments
  belongs_to :device_genre
  
  with_options presence: true do
    validates :device_name
    validates :device_caption
    validates :price
  end
  
  def get_image(width, height)
    unless device_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    device_image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end
end
