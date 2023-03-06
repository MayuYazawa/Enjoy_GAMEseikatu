class Admin::DeviceGenresController < ApplicationController
  def index
    @device_genre = DeviceGenre.new
    @device_genres = DeviceGenre.all
  end

  def create
    @device_genre = DeviceGenre.new(device_genre_params)
    if @device_genre.save
      redirect_to request.referer, notice: "ジャンルを追加しました。"
    else
      @device_genres = DeviceGenre.all
      render 'index'
    end
  end

  def edit
    @device_genre = DeviceGenre.find(params[:id])
  end

  def update
    device_genre = DeviceGenre.find(params[:id])
    if device_genre.update(device_genre_params)
      redirect_to admin_device_genres_path
    else
      @device_genre = DeviceGenre.find(params[:id])
      @device_genre.update(device_genre_params)
      render "edit"
    end
  end

  def destroy
    @device_genre = DeviceGenre.find(params[:id])
    @device_genre.destroy
    redirect_to admin_device_genres_path
  end

  private

  def device_genre_params
    params.require(:device_genre).permit(:device_genre_name)
  end
end