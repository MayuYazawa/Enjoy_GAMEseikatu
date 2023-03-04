class GameGenre < ApplicationRecord
  
  has_many :games
  validates :game_genre_name, presence:true, uniqueness: true
end
