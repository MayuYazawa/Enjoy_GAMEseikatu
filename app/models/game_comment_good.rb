class GameCommentGood < ApplicationRecord
  
  has_many :game_comments
  has_many :users
end
