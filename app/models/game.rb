class Game < ApplicationRecord

  has_one_attached :game_image

  has_many :game_comments
  belongs_to :game_genre
  belongs_to :user

  with_options presence: true do
    validates :game_name
    validates :game_caption
    validates :price
  end
  
  def get_image(width, height)
    unless game_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    game_image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end
end
