class DeviceCommentGood < ApplicationRecord

  has_many :device_comments
  belongs_to :user

  def liked_by?(user)
    device_comment_goods.exists?(user_id: user.id)
  end
end
