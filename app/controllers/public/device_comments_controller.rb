class Public::DeviceCommentsController < ApplicationController
  def new
  end

  def create
    @comment = current_user.device_comments.new(device_comment_params)
    @comment.save
    redirect_to device_path(@comment.device)
  end

  def update
  end

  def edit
  end

  def index
  end

  def show
  end

  def destroy
    @comment = DeviceComment.find(params[:id])
    @comment.destroy
  end

  private

  def device_comment_params
    params.require(:device_comment).permit(:title, :body, :rate, :device_id)
  end
end
