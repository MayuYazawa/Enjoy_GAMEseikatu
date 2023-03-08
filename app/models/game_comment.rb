class GameComment < ApplicationRecord

  has_many :game_comment_goods
  belongs_to :user
  belongs_to :game

end
