class DeviceComment < ApplicationRecord

  has_many :device_comment_goods
  belongs_to :user
  belongs_to :device

  def liked_by?(user)
    device_comment_goods.exists?(user_id: user.id)
  end
end
