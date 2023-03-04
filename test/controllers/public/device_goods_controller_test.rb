require "test_helper"

class Public::DeviceGoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_device_goods_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_device_goods_destroy_url
    assert_response :success
  end
end
