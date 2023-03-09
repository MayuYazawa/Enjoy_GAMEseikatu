class Public::DeviceCommentsController < ApplicationController
  def new
  end

  def create
    @device_comment = DeviceComment.new(device_comment_params)
    @device_comment.user_id = current_user.id
    if @device_comment.save
      redirect_to device_path(@device_comment.device)  , notice: "投稿しました。"
    else
      render :new
    end
  end

  def update
    @device_comment = DeviceComment.find(params[:id])
    if @device_comment.update(device_comment_params)
      redirect_to device_path(@device_comment.device.id)
    else
      render "edit"
    end
  end

  def edit
    @device_comment = DeviceComment.find(params[:id])
  end

  def index

  end

  def show
    @device = Device.find(params[:id])
    @device_comment = DeviceComment.new
    @device_genres = DeviceGenre.all
      if params[:device_genre_id].present?
        @device_genre = GeviceGenre.find(params[:device_genre_id])
        @devices = @device_genre.page(params[:page]).per(8)
      end
  end

  def destroy
    @device_comment = DeviceComment.find(params[:id])
    @device_comment.destroy
  end

  private

  def device_comment_params
    params.require(:device_comment).permit(:title, :body, :rate, :device_id)
  end
end
