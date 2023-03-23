class Device < ApplicationRecord


  has_many :device_comments, dependent: :destroy
  has_many :device_goods, dependent: :destroy
  belongs_to :device_genre
  belongs_to :user

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

  def self.looks(search, word)
    if search == "perfect_match"
      @device = Device.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @device = Device.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @device = Device.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @device = Device.where("title LIKE?","%#{word}%")
    else
      @device = Device.all
    end
  end

  def liked_by?(user)
    device_goods.exists?(user_id: user.id)
  end
end
