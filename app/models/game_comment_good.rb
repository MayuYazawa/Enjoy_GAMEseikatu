class GameCommentGood < ApplicationRecord
  
  has_many :game_comments
  belongs_to :user
end
