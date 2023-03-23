class GameComment < ApplicationRecord

  has_many :game_comment_goods, dependent: :destroy
  belongs_to :user
  belongs_to :game

  def liked_by?(user)
    game_comment_goods.exists?(user_id: user.id)
  end
end
