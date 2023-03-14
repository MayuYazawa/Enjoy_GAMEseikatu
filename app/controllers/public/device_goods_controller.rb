class Public::DeviceGoodsController < ApplicationController
  def create
    device = Device.find(params[:device_id])
    @device_good = current_user.device_goods.new(device_id: device.id)
    @device_good.save
    render 'replace_btn'
  end

  def destroy
    device = Device.find(params[:device_id])
    @device_good = current_user.device_goods.find_by(device_id: device.id)
    @device_good.destroy
    render 'replace_btn'
  end
end
