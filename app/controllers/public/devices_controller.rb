class Public::DevicesController < ApplicationController
  def index
    @devices = Device.page(params[:page]).per(8)
    @device_genres = DeviceGenre.all
      if params[:device_genre_id].present?
        @device_genre = DeviceGenre.find(params[:device_genre_id])
        @devices = @device_genre.devices.page(params[:page]).per(8)
      end
  end

  def show
    @device = Device.find(params[:id])
    @device_comment = DeviceComment.new
    @device_genres = DeviceGenre.all
      if params[:device_genre_id].present?
        @device_genre = DeviceGenre.find(params[:device_genre_id])
        @devices = @device_genre.page(params[:page]).per(8)
      end
  end

  def new
    @device = Device.new
    @device_genre = DeviceGenre.all
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(device_params)
      redirect_to device_path(@device.id)
    else
      render "edit"
    end
  end

  def destroy
    @device.destroy
    redirect_to devices_path
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      redirect_to devices_path, notice: "投稿しました。"
    else
      render :new
    end
  end

  def edit
    @device = Device.find(params[:id])
  end

  private
  def device_params
    params.require(:device).permit(:device_image, :device_genre_id, :device_name, :device_caption, :price, :brand, :amazon)
  end
end
