class Game < ApplicationRecord


  has_many :game_comments, dependent: :destroy
  has_many :game_goods, dependent: :destroy
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

  def self.looks(search, word)
    if search == "perfect_match"
      @game = Game.where("game_name LIKE?","#{word}")
    elsif search == "forward_match"
      @game = Game.where("game_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @game = Game.where("game_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @game = Game.where("game_name LIKE?","%#{word}%")
    else
      @game = Game.all
    end
  end

  def liked_by?(user)
    game_goods.exists?(user_id: user.id)
  end
end
