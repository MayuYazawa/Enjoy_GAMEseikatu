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
    if params[:jan].present?
      @rakuten = RakutenWebService::Books::Game.search(jan: params[:jan])
      @rakuten.each do |r|
        @device = Device.new
        @device.device_image = r['largeImageUrl']
        @device.device_name  = r['title']
        @device.device_caption = r['itemCaption']
        @device.price = r['itemPrice']
        @device.brand = r['hardware']
      end
    else
      @device = Device.new
    end
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
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to devices_path
  end

  def create
    @device = Device.new(device_params)
    @device.user_id = current_user.id
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
    params.require(:device).permit(:device_genre_id, :device_name, :device_caption, :price, :brand, :device_image)
  end
end
