class Admin::DeviceCommentsController < ApplicationController
before_action :authenticate_admin!
  def index
    @device_comments = DeviceComment.page(params[:page]).per(10).order(created_at: "DESC")
  end

  def current_user_device_comment
    @device_comments = DeviceComment.where(user_id: params[:id])
  end

  def show
    @device_comment = DeviceComment.find(params[:id])
  end

  def update
    @device_comment = DeviceComment.find(params[:id])
    @device_comment_details = DeviceCommentDetail.where(device_comment_id: params[:id])
    if @device_comment.update(device_comment_params)
    end
    redirect_to admin_device_comment_path(@device_comment)
  end

  def destroy
    device_comment = DeviceComment.find(params[:id])
    device_comment.destroy
    @device_comments = DeviceComment.all
    redirect_to admin_device_comments_path
  end

  private

  def device_comment_params
    params.require(:device_comment).permit(:rate)
  end
end
