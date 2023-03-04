class GameGood < ApplicationRecord
  
  has_many :users
  has_many :games
end
