class Public::DeviceCommentGoodsController < ApplicationController

  def create
    device_comment = DeviceComment.find(params[:device_comment_id])
    device_comment_good = current_user.device_comment_goods.new(device_comment_id: device_comment.id)
    device_comment_good.save
    redirect_to device_path(device_comment.device_id)
  end

  def destroy
    device_comment = DeviceComment.find(params[:device_comment_id])
    device_comment_good = current_user.device_comment_goods.find_by(device_comment_id: device_comment.id)
    device_comment_good.destroy
    redirect_to device_path(device_comment.device_id)
  end
end