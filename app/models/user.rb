class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :game_comments
  has_many :game_goods
  has_many :game_comment_goods
  
  with_options presence: true do
    validates :username
    validates :email
    validates :gender
  end

end
