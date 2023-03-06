class GameComment < ApplicationRecord

  has_many :game_comment_goods
  has_one :user

end
