class Public::DeviceGoodsController < ApplicationController

  def create
    device = Device.find(params[:device_id])
    device_good = current_user.device_goods.new(device_id: device.id)
    device_good.save
    redirect_to device_path(params[:device_id])
  end

  def destroy
    device = Device.find(params[:device_id])
    device_good = current_user.device_goods.find_by(device_id: device.id)
    device_good.destroy
    redirect_to device_path(params[:device_id])
  end
end
