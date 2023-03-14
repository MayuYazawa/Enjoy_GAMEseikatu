class Public::DeviceCommentGoodsController < ApplicationController
  def create
    device_comment = DeviceComment.find(params[:device_comment_id])
    @device_comment_good = current_user.device_comment_goods.new(device_comment_id: device_comment.id)
    @device_comment_good.save
    render 'replace_btn'
  end

  def destroy
    device_comment = DeviceComment.find(params[:device_comment_id])
    @device_comment_good = current_user.device_comment_goods.find_by(device_comment_id: device_comment.id)
    @device_comment_good.destroy
    render 'replace_btn'
  end
end