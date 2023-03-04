class Game < ApplicationRecord

  has_one_attached :game_image

  has_many :game_comments
  belongs_to :game_genre

  with_options presence: true do
    validates :game_name
    validates :game_caption
    validates :price
  end
end
