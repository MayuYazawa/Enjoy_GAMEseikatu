class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :game_comments
  has_many :game_goods
  has_many :game_comment_goods
  has_many :device_goods
  has_many :device_comment_goods
  has_many :games
  has_many :devises
  has_many :device_comments

  with_options presence: true do
    validates :username
    validates :email
    validates :gender
  end

  def self.guest
    find_or_create_by!(username: "guestuser" ,email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.gender = "man"
      user.username = "guestuser"
    end
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("username LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("username LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("username LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("username LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
end
