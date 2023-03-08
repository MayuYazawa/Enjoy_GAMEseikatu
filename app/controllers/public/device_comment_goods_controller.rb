class Public::DeviceCommentGoodsController < ApplicationController
  def create
    device = Device.find(params[:device_id])
    @comment = current_user.device_comments.new(device_comment_params)
    @comment.device_id = device.id
    @comment.save
  end

  def destroy
    @comment = DeviceComment.find(params[:id])
    @comment.destroy
  end

  private

  def device_comment_params
    params.require(:book_comment).permit(:title, :body, :rate)
  end
end
