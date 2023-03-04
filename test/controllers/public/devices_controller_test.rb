require "test_helper"

class Public::DevicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_devices_index_url
    assert_response :success
  end

  test "should get show" do
    get public_devices_show_url
    assert_response :success
  end

  test "should get new" do
    get public_devices_new_url
    assert_response :success
  end

  test "should get update" do
    get public_devices_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_devices_destroy_url
    assert_response :success
  end

  test "should get create" do
    get public_devices_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_devices_edit_url
    assert_response :success
  end
end
